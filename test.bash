#!/bin/bash

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `kadai.py` のテスト

# 正常な入力
out=$(echo "1 2 3 4 5" | ./kadai.py)
expected_output="入力された数値の中で一番大きい数は: 5
入力された数値の中で一番小さい数は: 1
入力された数値の平均値は: 3.0"
[ "$out" = "$expected_output" ] || { echo "期待値: $expected_output"; echo "出力値: $out"; ng "$LINENO"; }

out=$(echo "10 -20 30 -40 50" | ./kadai.py)
expected_output="入力された数値の中で一番大きい数は: 50
入力された数値の中で一番小さい数は: -40
入力された数値の平均値は: 6.0"
[ "$out" = "$expected_output" ] || { echo "期待値: $expected_output"; echo "出力値: $out"; ng "$LINENO"; }

# 数値以外の入力
out=$(echo "1 2 あ 4 5" | ./kadai.py 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "エラー: could not convert string to float: 'あ'" ] || ng "$LINENO"

# 空入力
out=$(echo "" | ./kadai.py 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "エラー: 数値が入力されていません" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

