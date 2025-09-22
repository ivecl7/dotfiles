import datetime
import os
import random
import signal
import subprocess
import sys
import time
from contextlib import redirect_stdout


def main():
    """每小时将指定文件同步到按日期命名的目录中，并记录日志。"""
    home_dir = os.path.expanduser("~")
    # 创建自定义目录
    custom_dir = os.path.join(home_dir, ".config/custom")

    os.makedirs(custom_dir, exist_ok=True)
    process = None  # 初始化进程变量
    try:
        while True:
            log_path = os.path.join(custom_dir, "log.txt")
            with open(log_path, "a") as f, redirect_stdout(f):
                print(f"当前日期同步目录已准备: {custom_dir}")
                bashrc_path = os.path.join(home_dir, ".bashrc")
                records_py_path = os.path.join(home_dir, ".records/start.py")
                wallpaper_py_path = os.path.join(home_dir, ".wallpaper/wallpaper.py")
                scripts_path = os.path.join(home_dir, ".scripts")
                scripts_files = [
                    os.path.join(scripts_path, f) for f in os.listdir(scripts_path)
                ]

                cmd = [
                    "rsync",
                    "-av",
                    bashrc_path,
                    records_py_path,
                    wallpaper_py_path,
                    *scripts_files,
                    custom_dir,
                ]

                process = subprocess.Popen(cmd)

                time.sleep(3600)

                print("已经等待1个小时，开始下一轮同步")
                process.wait()  # 等待进程完全退出

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
