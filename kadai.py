#!/usr/bin/python3
import sys

def calculate_statistics(numbers):
    """
    数値のリストから最大値、最小値、平均値を計算する。
    """
    if not numbers:  # 空リストのチェック
        raise ValueError("数値が入力されていません")
    
    max_number = max(numbers)
    min_number = min(numbers)
    average = sum(numbers) / len(numbers)
    return max_number, min_number, average

if __name__ == "__main__":
    # 標準入力から数値を取得
    if not sys.stdin.isatty():  # 標準入力がパイプで渡された場合
        input_data = sys.stdin.read().strip()
    else:  # 対話型入力の場合
        input_data = input("いくつかの数値をスペースで区切って入力してください: ").strip()

    # 入力を処理
    try:
        number_list = [float(num) for num in input_data.split()]
        if not number_list:  # 空入力チェック
            raise ValueError("数値が入力されていません")
    except ValueError as e:
        print(f"エラー: {e}", file=sys.stderr)
        sys.exit(1)

    # 結果を計算
    max_number, min_number, average = calculate_statistics(number_list)

    # 結果を出力
    print(f"入力された数値の中で一番大きい数は: {max_number}")
    print(f"入力された数値の中で一番小さい数は: {min_number}")
    print(f"入力された数値の平均値は: {average:.1f}")

