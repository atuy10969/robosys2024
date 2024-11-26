#!/bin/bash

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `plus` のテスト
out=$(echo "1 2 3 4 5" | ./plus)
[ "$out" = "15" ] || ng "$LINENO"

out=$(echo "10.5 20.3" | ./plus)
[ "$out" = "30.8" ] || ng "$LINENO"

out=$(echo "1 -2 3 -4 5" | ./plus)
[ "$out" = "3" ] || ng "$LINENO"

out=$(echo "あ" | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo "" | ./plus)  # 空入力
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# `average` のテスト
out=$(echo "1 2 3 4 5" | ./average.txt)
[ "$out" = "3.0" ] || ng "$LINENO"

out=$(echo "10.5 20.3" | ./average.txt)
[ "$out" = "15.4" ] || ng "$LINENO"

out=$(echo "あ" | ./average.txt)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo "" | ./average.txt)  # 空入力
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

