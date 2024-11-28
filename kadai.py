#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 s23C1041LJ@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause
try:
    numbers = input("いくつかの数値をスペースで区切って入力してください: ")  # 標準入力を受け付け
    numbers = list(map(float, numbers.split()))  # 入力された数値を分割してリストに変換

    if not numbers:  # 入力が空の場合
        raise ValueError("値が入力されていません。")

    # 数値をそのまま使用
    max_num = max(numbers)
    min_num = min(numbers)
    average = sum(numbers) / len(numbers)

    # 結果を出力
    print(f"入力された数値の中で一番大きい数は: {max_num}")
    print(f"入力された数値の中で一番小さい数は: {min_num}")
    print(f"入力された数値の平均値は: {average}")

except ValueError as e:
    print(f"エラー: {e}")

