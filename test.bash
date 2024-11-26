#!/bin/bash

# 期待される出力
expected_output1="入力された数値の中で一番大きい数は: 5"
expected_output2="入力された数値の中で一番小さい数は: 1"
expected_output3="入力された数値の平均値は: 3.0"

expected_output4="入力された数値の中で一番大きい数は: 50"
expected_output5="入力された数値の中で一番小さい数は: -40"
expected_output6="入力された数値の平均値は: 6.0"

# 1回目のテスト (20 30 40)
echo "20 30 40" | ./kadai.py > output.txt
if grep -q "$expected_output1" output.txt && grep -q "$expected_output2" output.txt && grep -q "$expected_output3" output.txt; then
    echo "テスト1: 成功"
else
    echo "テスト1: 失敗"
    cat output.txt
fi

# 2回目のテスト (50 -40 10)
echo "50 -40 10" | ./kadai.py > output.txt
if grep -q "$expected_output4" output.txt && grep -q "$expected_output5" output.txt && grep -q "$expected_output6" output.txt; then
    echo "テスト2: 成功"
else
    echo "テスト2: 失敗"
    cat output.txt
fi

