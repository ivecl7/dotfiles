import datetime
import os
import random
import signal
import subprocess
import sys
import time
from contextlib import redirect_stdout


def main():
    """
    主函数：处理屏幕录制的无限循环。
    - 确保录制目录存在
    - 生成时间戳用于文件名
    - 启动wf-recorder进程
    - 等待5分钟后停止录制
    - 随机等待10-30分钟后重复
    """
    # 获取用户主目录并构建录制目录路径
    home_dir = os.path.expanduser("~")
    record_dir = os.path.join(home_dir, ".records")

    # 检查录制目录是否存在，如果不存在则创建
    os.makedirs(record_dir, exist_ok=True)
    print(f"主录制目录已确认: {record_dir}")
    process = None  # 初始化进程变量
    try:
        while True:
            # 生成日期目录（格式 YYYYMMDD）并确保其存在
            current_date = datetime.datetime.now().strftime("%Y%m%d")
            date_dir = os.path.join(record_dir, current_date)
            os.makedirs(date_dir, exist_ok=True)
            log_path = os.path.join(date_dir, "log.txt")
            with open(log_path, "a") as f, redirect_stdout(f):
                print(f"当前日期录制目录已准备: {date_dir}")
                # 生成当前时间的时间戳，格式为HHMMSS
                timestamp = datetime.datetime.now().strftime("%H%M%S")
                # 构建完整的文件路径
                file_path = os.path.join(date_dir, f"recoders-{timestamp}.mkv")
                # 构建wf-recorder命令
                cmd = ["wf-recorder", "-a", "-c", "h264_nvenc", "-f", file_path]

                print(f"开始录制到文件: {file_path}")
                # 启动wf-recorder进程
                process = subprocess.Popen(cmd)

                # 等待5分钟（300秒）
                time.sleep(300)

                print("5分钟录制结束，停止录制...")
                # 终止wf-recorder进程
                process.terminate()
                process.wait()  # 等待进程完全退出
                print("录制已停止。")

                # 生成随机等待时间（10-30分钟，转换为秒）
                wait_seconds = random.randint(600, 1800)  # 600秒=10分钟, 1800秒=30分钟
                wait_minutes = wait_seconds / 60
                print(f"随机等待 {wait_minutes:.2f} 分钟后开始下一次录制。")
                time.sleep(wait_seconds)  # 等待随机时间

    except KeyboardInterrupt:
        # 处理用户按Ctrl+C中断脚本
        print("\n用户中断脚本执行。")
        if process is not None and process.poll() is None:
            print("正在终止当前录制进程...")
            process.terminate()
            process.wait()
        print("脚本已退出。")
    except Exception as e:
        # 处理其他异常
        print(f"发生错误: {e}")
        if process is not None and process.poll() is None:
            process.terminate()
            process.wait()


if __name__ == "__main__":
    main()
