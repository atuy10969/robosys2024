# ユーザーから数値を入力してもらう
numbers = input("いくつかの数値をスペースで区切って入力してください: ")

# 入力された文字列をスペースで分割してリストに変換し、各要素を整数に変換
number_list = [int(num) for num in numbers.split()]

# 最大値、最小値、平均値を求める
max_number = max(number_list)
min_number = min(number_list)
average = sum(number_list) / len(number_list)

# 結果を表示
print("入力された数値の中で一番大きい数は:", max_number)
print("入力された数値の中で一番小さい数は:", min_number)
print("入力された数値の平均値は:", average)

