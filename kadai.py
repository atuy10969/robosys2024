#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 s23C1041LJ@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

import math

def parse_input(expression):
    """数学的な文字列を評価して数値を返す"""
    expression = expression.replace("π", str(math.pi))  # π を math.pi に置換
    try:
        return eval(expression, {"__builtins__": {}}, {"math": math})
    except (NameError, SyntaxError):
        raise ValueError(f"無効な入力: {expression}")

try:
    numbers_input = input("いくつかの数値をスペースで区切って入力してください: ")  # 標準入力を受け付け
    numbers = [(num, parse_input(num)) for num in numbers_input.split()]  # (元の入力, 解析値) のタプルを作成

    if not numbers:  # 入力が空の場合
        raise ValueError("値が入力されていません。")

    # 最大値と最小値を解析値から取得
    max_num = max(numbers, key=lambda x: x[1])  # 最大値 (元の形式, 数値)
    min_num = min(numbers, key=lambda x: x[1])  # 最小値 (元の形式, 数値)
    average = sum(x[1] for x in numbers) / len(numbers)  # 平均値

    # 結果を出力
    print(f"入力された数値の中で一番大きい数は: {max_num[0]}")  # 元の形式で出力
    print(f"入力された数値の中で一番小さい数は: {min_num[0]}")  # 元の形式で出力
    print(f"入力された数値の平均値は: {average}")

except ValueError as e:
    print(f"エラー: {e}")

