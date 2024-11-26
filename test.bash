i#!/bin/bash

# ng関数を定義（エラー時に行番号を表示）
ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `kadai.py` のテスト

# 正常な入力を与えて、結果が期待通りかチェック
out=$(echo "10 20 30 40 50" | python3 kadai.py)
expected="入力された数値の中で一番大きい数は: 50
入力された数値の中で一番小さい数は: 10
入力された数値の平均値は: 30.0"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 無効な入力（文字列）を与えてエラーが発生するか確認
out=$(echo "10 20 あ 40 50" | python3 kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 引数が不足している場合
out=$(python3 kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 結果がすべて正常ならOKを表示
[ "$res" = 0 ] && echo OK
exit $res

