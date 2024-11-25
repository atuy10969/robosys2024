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

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"

# `average` のテスト
if [ -x ./average ]; then
    out=$(seq 5 | ./average)
    [ "${out}" = "3.0" ] || ng "$LINENO"

    out=$(echo あ | ./average)
    [ "$?" = 1 ] || ng "$LINENO"

    out=$(echo | ./average)
    [ "$?" = 1 ] || ng "$LINENO"
else
    echo "average プログラムが見つかりません。" >&2
    res=1
fi

# 結果を表示
if [ "$res" = 0 ]; then
    echo "すべてのテストが成功しました。"
else
    echo "いくつかのテストが失敗しました。"
fi

exit $res

