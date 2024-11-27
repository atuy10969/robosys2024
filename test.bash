#!/bin/bash

set -e  # エラー発生時に中断

# 結果判定用変数
res=0

# テスト1: (20 30 40)
echo "20 30 40" | ./kadai.py > output.txt
expected_output1="入力された数値の中で一番大きい数は: 40"
expected_output2="入力された数値の中で一番小さい数は: 20"
expected_output3="入力された数値の平均値は: 30.0"

if grep -q "$expected_output1" output.txt && grep -q "$expected_output2" output.txt && grep -q "$expected_output3" output.txt; then
    echo "テスト1: 成功"
else
    echo "テスト1: 失敗"
    cat output.txt
    res=1
fi

# テスト2: (50 -40 10)
echo "50 -40 10" | ./kadai.py > output.txt
expected_output4="入力された数値の中で一番大きい数は: 50"
expected_output5="入力された数値の中で一番小さい数は: -40"
expected_output6="入力された数値の平均値は: 6.0"

if grep -q "$expected_output4" output.txt && grep -q "$expected_output5" output.txt && grep -q "$expected_output6" output.txt; then
    echo "テスト2: 成功"
else
    echo "テスト2: 失敗"
    cat output.txt
    res=1
fi

# テスト結果に応じて終了コードを設定
if [ "$res" -eq 0 ]; then
    echo "すべてのテストが成功しました"
    exit 0
else
    echo "いくつかのテストが失敗しました"
    exit 1
fi

