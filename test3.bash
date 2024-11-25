#!/bin/bash 

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `plus` のテスト
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# `average` のテスト
out=$(seq 5 | ./average)
[ "${out}" = "3.0" ] || ng "$LINENO"  # 1+2+3+4+5 = 15; 平均は 15/5 = 3.0

out=$(echo あ | ./average)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./average)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 最大値のテスト
out=$(seq 5 | ./max)
[ "${out}" = 5 ] || ng "$LINENO"  # 1, 2, 3, 4, 5 の最大値は 5

out=$(echo あ | ./max)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./max)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 最小値のテスト
out=$(seq 5 | ./min)
[ "${out}" = 1 ] || ng "$LINENO"  # 1, 2, 3, 4, 5 の最小値は 1

out=$(echo あ | ./min)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./min)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

