ii#!/bin/bash

# ng関数を定義（エラー時に行番号を表示）
ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# `plus` のテスト
out=$(echo "1 2 3 4 5" | ./plus)
if [ "$out" != "15" ]; then
  ng "$LINENO"
fi

out=$(echo "10.5 20.3" | ./plus)
if [ "$out" != "30.8" ]; then
  ng "$LINENO"
fi

out=$(echo "1 -2 3 -4 5" | ./plus)
if [ "$out" != "3" ]; then
  ng "$LINENO"
fi

out=$(echo "あ" | ./plus)
if [ "$?" != 1 ] || [ "$out" != "" ]; then
  ng "$LINENO"
fi

out=$(echo "" | ./plus)  # 空入力
if [ "$?" != 1 ] || [ "$out" != "" ]; then
  ng "$LINENO"
fi

# `average` のテスト
out=$(echo "1 2 3 4 5" | ./average.txt)
if [ "$out" != "3.0" ]; then
  ng "$LINENO"
fi

out=$(echo "10.5 20.3" | ./average.txt)
if [ "$out" != "15.4" ]; then
  ng "$LINENO"
fi

out=$(echo "あ" | ./average.txt)
if [ "$?" != 1 ] || [ "$out" != "" ]; then
  ng "$LINENO"
fi

out=$(echo "" | ./average.txt)  # 空入力
if [ "$?" != 1 ] || [ "$out" != "" ]; then
  ng "$LINENO"
fi

# 結果がすべて正常ならOKを表示
if [ "$res" = 0 ]; then
  echo "OK"
fi

exit $res

