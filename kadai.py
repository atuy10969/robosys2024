#!/usr/bin/env python3

numbers = input("いくつかの数値をスペースで区切って入力してください: ")  # 標準入力を受け付け
numbers = list(map(float, numbers.split()))  # 入力された数値を分割してリストに変換

# 数値を整数にキャスト
max_num = int(max(numbers))
min_num = int(min(numbers))
average = sum(numbers) / len(numbers)

# 結果を出力
print(f"入力された数値の中で一番大きい数は: {max_num}")
print(f"入力された数値の中で一番小さい数は: {min_num}")
print(f"入力された数値の平均値は: {average}")

