#!/home/rthetapi/.venv/bin/python
import os
import random
import subprocess
import sys
import time
from pathlib import Path

# 支持的视频文件扩展名
VIDEO_EXTENSIONS = {".mp4", ".avi", ".mov", ".mkv", ".flv", ".wmv", ".webm"}


def is_video_file(filepath):
    """检查文件是否为视频文件"""
    return (
        os.path.isfile(filepath) and Path(filepath).suffix.lower() in VIDEO_EXTENSIONS
    )


def get_video_files(directory):
    """获取目录中的所有视频文件"""
    if not os.path.exists(directory):
        raise FileNotFoundError(f"目录不存在: {directory}")

    if not os.path.isdir(directory):
        raise NotADirectoryError(f"路径不是目录: {directory}")

    video_files = []
    for file in os.listdir(directory):
        filepath = os.path.join(directory, file)
        if is_video_file(filepath):
            video_files.append(filepath)

    if not video_files:
        raise ValueError(f"目录中没有找到视频文件: {directory}")

    return sorted(video_files)  # 按字母顺序排序


def create_symlink(target_path, link_path):
    """创建符号链接"""
    # 如果链接已存在，先删除
    if os.path.exists(link_path) or os.path.islink(link_path):
        os.remove(link_path)

    # 创建新的符号链接
    os.symlink(target_path, link_path)
    print(f"已创建链接: {link_path} -> {target_path}")


def main():
    ON_BOOT = True
    ON_CHANGE = False
    # 确定要使用的视频文件
    video_files = []

    # 检查用户是否提供了文件路径
    if len(sys.argv) > 1:
        ON_BOOT = False
        ON_CHANGE = True
        user_path = sys.argv[1]
        if not os.path.exists(user_path):
            print(f"错误: 路径不存在: {user_path}")
            return
        if not is_video_file(user_path):
            print(f"错误: 文件不是支持的视频格式: {user_path}")
            print(f"支持的格式: {', '.join(VIDEO_EXTENSIONS)}")
            return
        video_files = [user_path]
    else:
        # 使用默认目录
        default_dir = os.path.join(
            os.path.dirname(os.path.abspath(__file__)), "default"
        )
        try:
            video_files = get_video_files(default_dir)
            print(f"在默认目录中找到 {len(video_files)} 个视频文件")
        except Exception as e:
            print(f"错误: {e}")
            return

    # 如果没有视频文件，退出
    if not video_files:
        print("错误: 没有可用的视频文件")
        return

    # 创建符号链接的路径
    script_dir = os.path.dirname(os.path.abspath(__file__))
    link_path = os.path.join(script_dir, "current")

    # 初始索引
    current_index = 0

    # 主循环
    try:
        while True:
            # 创建当前视频的链接
            if ON_BOOT != True:
                current_video = video_files[current_index]
                create_symlink(current_video, link_path)
                command = "systemctl --user restart mpvpaper-wallpaper.service"
                subprocess.run(command, shell=True)
                if ON_CHANGE:
                    return
            else:
                ON_BOOT = False

            # 等待10分钟
            print(f"等待10分钟... 当前时间: {time.strftime('%Y-%m-%d %H:%M:%S')}")
            time.sleep(10 * 60)  # 10分钟

            # 更新索引（循环）
            current_index = (current_index + random.randint(1, len(video_files))) % len(
                video_files
            )

    except KeyboardInterrupt:
        print("\n程序被用户中断")
    except Exception as e:
        print(f"发生错误: {e}")


if __name__ == "__main__":
    main()
