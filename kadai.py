# kadai.py

def calculate_statistics(numbers):
    """
    数値のリストから最大値、最小値、平均値を計算する。
    """
    max_number = max(numbers)
    min_number = min(numbers)
    average = sum(numbers) / len(numbers)
    return max_number, min_number, average

if __name__ == "__main__":
    # ユーザーから数値を入力してもらう
    numbers = input("いくつかの数値をスペースで区切って入力してください: ")

    # 入力を整数のリストに変換
    number_list = [int(num) for num in numbers.split()]

    # 計算を実行
    max_number, min_number, average = calculate_statistics(number_list)

    # 結果を表示
    print("入力された数値の中で一番大きい数は:", max_number)
    print("入力された数値の中で一番小さい数は:", min_number)
    print("入力された数値の平均値は:", average)

