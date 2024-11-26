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
out=$(seq 5 | ./average.txt)
[ "${out}" = "3.0" ] || ng "$LINENO"  # 1+2+3+4+5 = 15; 平均は 15/5 = 3.0

out=$(echo あ | ./average.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./average.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# `max` のテスト
out=$(seq 5 | ./max.txt)
[ "${out}" = "5" ] || ng "$LINENO"  # 最大値は 5

out=$(echo "3 1 4 1 5 9" | ./max.txt)
[ "${out}" = "9" ] || ng "$LINENO"  # 最大値は 9

out=$(echo | ./max.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# `min` のテスト
out=$(seq 5 | ./min.txt)
[ "${out}" = "1" ] || ng "$LINENO"  # 最小値は 1

out=$(echo "3 1 4 1 5 9" | ./min.txt)
[ "${out}" = "1" ] || ng "$LINENO"  # 最小値は 1

out=$(echo | ./min.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

