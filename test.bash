i#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 s23C1041LJ@s.chibakoudai.jp
# SPDX-License-Identifier: BSD-3-Clause

ng() {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# テスト対象の Python バージョン
PYTHON_VERSIONS=("python3.7" "python3.8" "python3.9" "python3.10" "python3.11")

# Python バージョンごとにテストを実行
for python in "${PYTHON_VERSIONS[@]}"; do
    echo "=== Testing with ${python} ==="
    if ! command -v "${python}" > /dev/null; then
        echo "${python} が見つかりません。スキップします。"
        continue
    fi

    # 数値をコマンドライン引数として渡す
    out=$("${python}" kadai.py 1 2 3 4 5)
    echo "${out}" | grep -q "入力された数値の中で一番大きい数は: 5.0" || ng "$LINENO"
    echo "${out}" | grep -q "入力された数値の中で一番小さい数は: 1.0" || ng "$LINENO"
    echo "${out}" | grep -q "入力された数値の平均値は: 3.0" || ng "$LINENO"

    out=$("${python}" kadai.py 10.5 20.3)
    echo "${out}" | grep -q "入力された数値の中で一番大きい数は: 20.3" || ng "$LINENO"
    echo "${out}" | grep -q "入力された数値の中で一番小さい数は: 10.5" || ng "$LINENO"
    echo "${out}" | grep -q "入力された数値の平均値は: 15.4" || ng "$LINENO"

    out=$("${python}" kadai.py あ)
    echo "${out}" | grep -q "エラー:" || ng "$LINENO"

    out=$("${python}" kadai.py)
    echo "${out}" | grep -q "エラー:" || ng "$LINENO"

    echo "=== ${python} テスト完了 ==="
done

[ "${res}" = 0 ] && echo "OK"
exit "${res}"

