#!/bin/bash

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# 足し算のテスト
out=$(echo "10 20 30" | ./plus)
[ "${out}" = "60.0" ] || ng "$LINENO"

# 平均値のテスト
out=$(echo "10 20 30" | ./average.txt)
[ "${out}" = "20.0" ] || ng "$LINENO"

# 最小値のテスト
out=$(echo "10 20 30" | ./min.txt)
[ "${out}" = "10.0" ] || ng "$LINENO"

# 最大値のテスト
out=$(echo "10 20 30" | ./max.txt)
[ "${out}" = "30.0" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

