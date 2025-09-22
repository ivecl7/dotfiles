import argparse
import datetime
import os
import time
import zipfile
from pathlib import Path


def create_backup_zip():
    """
    创建备份压缩包的主要函数
    """
    # 源目录路径
    source_dir = Path.home() / ".data"  # 用户主目录下的.data文件夹

    # 检查源目录是否存在
    if not source_dir.exists() or not source_dir.is_dir():
        print(f"错误: 源目录 {source_dir} 不存在或不是目录")
        return False

    # 目标目录路径
    target_dir = Path("/mnt/data/doc/vimwiki")

    # 确保目标目录存在
    target_dir.mkdir(parents=True, exist_ok=True)

    # 生成基于当前日期的文件名 (YYYYMMDD格式)
    current_date = datetime.datetime.now().strftime("%Y%m%d")
    zip_filename = f"{current_date}.zip"
    zip_path = target_dir / zip_filename

    try:
        # 创建zip文件 (使用覆盖模式 'w')
        with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
            # 遍历源目录中的所有文件
            for file_path in source_dir.rglob("*"):
                if file_path.is_file():
                    # 计算在zip文件中的相对路径
                    arcname = file_path.relative_to(source_dir)
                    # 添加文件到zip
                    zipf.write(file_path, arcname)
                    print(f"已添加: {file_path}")

        print(f"备份完成: {zip_path}")
        return True

    except Exception as e:
        print(f"创建备份时出错: {e}")
        return False


def schedule_daily_backup():
    """
    安排每日23:55自动执行备份
    """
    while True:
        now = datetime.datetime.now()

        # 计算下一次执行时间 (今天的23:55)
        next_run = now.replace(hour=23, minute=55, second=0, microsecond=0)

        # 如果现在时间已经过了今天的23:55，则安排到明天的23:55
        if now > next_run:
            next_run += datetime.timedelta(days=1)

        # 计算需要等待的秒数
        wait_seconds = (next_run - now).total_seconds()

        print(f"下一次备份将在 {next_run} 执行")
        time.sleep(wait_seconds)

        # 执行备份
        create_backup_zip()


def main():
    """
    主函数，处理命令行参数和程序流程
    """
    parser = argparse.ArgumentParser(description="自动备份 ~/.data 目录到zip文件")
    parser.add_argument(
        "--daemon",
        "-d",
        action="store_true",
        help="以守护进程模式运行，每日23:55自动执行",
    )

    args = parser.parse_args()

    if args.daemon:
        print("启动守护进程模式，每日23:55自动备份...")
        schedule_daily_backup()
    else:
        print("立即执行备份...")
        create_backup_zip()


if __name__ == "__main__":
    main()
