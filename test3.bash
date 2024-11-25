#!/bin/bash

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `plus` のテスト
out=$(echo -e "10\n20\n30" | ./plus)  # 複数行の入力
[ "${out}" = "60" ] || ng "$LINENO"

out=$(echo "10 20 30" | ./plus)  # 1行で複数の数値（対応できるようにコード修正済み）
[ "${out}" = "60" ] || ng "$LINENO"

out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"  # 数字以外はエラー
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"  # 空入力はエラー
[ "${out}" = "" ] || ng "$LINENO"

# `average` のテスト
out=$(seq 5 | ./average.txt)  # 1, 2, 3, 4, 5 の平均値 = 3.0
[ "${out}" = "3.0" ] || ng "$LINENO"

out=$(echo あ | ./average.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./average.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# `min` のテスト
out=$(seq 5 | ./min.txt)  # 最小値は 1
[ "${out}" = "1" ] || ng "$LINENO"

out=$(echo あ | ./min.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./min.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# `max` のテスト
out=$(seq 5 | ./max.txt)  # 最大値は 5
[ "${out}" = "5" ] || ng "$LINENO"

out=$(echo あ | ./max.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./max.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 結果判定
[ "$res" = 0 ] && echo OK
exit $res

