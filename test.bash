#!/bin/bash

set -e  # エラー発生時に中断
res=0

# テストケース1
echo "1 2 3 4 5" | ./kadai.py > output.txt
if grep -q "入力された数値の中で一番大きい数は: 5.0" output.txt && \
   grep -q "入力された数値の中で一番小さい数は: 1.0" output.txt && \
   grep -q "入力された数値の平均値は: 3.0" output.txt; then
    echo "テスト1: 成功"
else
    echo "テスト1: 失敗"
    cat output.txt
    res=1
fi

# テストケース2
echo "10.5 20.3" | ./kadai.py > output.txt
if grep -q "入力された数値の中で一番大きい数は: 20.3" output.txt && \
   grep -q "入力された数値の中で一番小さい数は: 10.5" output.txt && \
   grep -q "入力された数値の平均値は: 15.4" output.txt; then
    echo "テスト2: 成功"
else
    echo "テスト2: 失敗"
    cat output.txt
    res=1
fi

# テストケース3（不正な入力）
echo "あ" | ./kadai.py > output.txt 2>&1
if grep -q "エラー: could not convert string to float" output.txt; then
    echo "テスト3: 成功"
else
    echo "テスト3: 失敗"
    cat output.txt
    res=1
fi

# テストケース4（空の入力）
echo "" | ./kadai.py > output.txt 2>&1
if grep -q "エラー: 値が入力されていません" output.txt; then
    echo "テスト4: 成功"
else
    echo "テスト4: 失敗"
    cat output.txt
    res=1
fi

if [ "$res" -eq 0 ]; then
    echo "すべてのテストが成功しました"
    exit 0
else
    echo "いくつかのテストが失敗しました"
    exit 1
fi

