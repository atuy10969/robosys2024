#!/bin/bash

# エラーハンドリング関数
ng() {
    echo "${1}行目が違うよ"
    res=1
}

res=0  # 初期値（成功を示す）

# 関数: Pythonスクリプトをテスト
run_test() {
    input="$1"           # 入力データ
    expected_output="$2" # 期待される出力
    line_number="$3"     # 行番号

    # 実際の出力を取得
    output=$(printf "%s\n" "$input" | python3 kadai.py 2>/dev/null)

    # 結果を比較
    if [[ "$output" != *"$expected_output"* ]]; then
        ng "$line_number"
    fi
}

# テスト 1: 正常な数値リストの入力
run_test "12 45 67 23 89" "入力された数値の中で一番大きい数は: 89" "$LINENO"
run_test "12 45 67 23 89" "入力された数値の中で一番小さい数は: 12" "$LINENO"
run_test "12 45 67 23 89" "入力された数値の平均値は: 47.2" "$LINENO"

# テスト 2: 空の入力
run_test "" "" "$LINENO"

# テスト 3: 数値以外の入力
run_test "abc" "" "$LINENO"

# テスト 4: 単一の数値
run_test "100" "入力された数値の中で一番大きい数は: 100" "$LINENO"
run_test "100" "入力された数値の中で一番小さい数は: 100" "$LINENO"
run_test "100" "入力された数値の平均値は: 100.0" "$LINENO"

# テスト結果を出力
if [ "$res" = 0 ]; then
    echo "全てのテストが成功しました！"
else
    echo "いくつかのテストが失敗しました。"
fi

exit $res

