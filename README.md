# ぱっと見で数を分類
![test](https://github.com/atuy10969/robosys2024/actions/workflows/test.yml/badge.svg)
![](https://img.shields.io/github/license/atuy10969/robosys2024)
# コマンドの説明
このコマンドは、数字を何個でもいいので打ち込んでいき、その打ち込まれた数の中で一番大きい数、一番小さい数、その中の平均値を導けるようなものです。

# 必要なソフトウエア
Python
  (テスト済みバージョン: 3.7 ~ 3.11)
  
# インストール方法
~~~
git clone https://github.com/atuy10969/robosys2024
~~~
## リポジトリ
~~~
cd tmp/robosys2024
~~~
## 実行
~~~
python3 number_status.py <数値1> <数値2> <数値3> ...
~~~
### 終了について
１回数字を入力して結果を出すと勝手に終了するようになっています。

# 実行結果

## （成功例1）
python3 number_status.py 3 4 5 6 70
入力された数値の中で一番大きい数は: 70.0
入力された数値の中で一番小さい数は: 3.0
入力された数値の平均値は: 17.6

## （成功例2）
 python3 number_status.py 3 4 5       6       70
入力された数値の中で一番大きい数は: 70.0
入力された数値の中で一番小さい数は: 3.0
入力された数値の平均値は: 17.6

## (成功例３)
 python3 number_status.py １ ２ ３ ４ ５
入力された数値の中で一番大きい数は: 5.0
入力された数値の中で一番小さい数は: 1.0
入力された数値の平均値は: 3.0

## (失敗例)
python3 number_status.py １ ２ ３ ４ ５　あ
エラー: could not convert string to float: '５\u3000あ'

上記に示している成功例1~3と失敗例の通り、数字の大文字、スペースはどれだけ開けてもしっかり結果を出すことはできているが、ひらがなのような文字を入力してしまった場合エラーを出してどこがエラーなのかを表示できるようになっている。

# テスト環境*
ubuntu20.04
# 参考資料
* [テスト実行・・・・ロボットシステム学（11/7スライド）](https://ryuichiueda.github.io/slides_marp/robosys2024/lesson7.html)
* [sys.argvの使い方完全ガイド【Python初心者向け】](https://dtnavi.tcdigital.jp/cat_system/language_184/)
* [ コマンドライン引数の使い方（sys.argv）](https://hibiki-press.tech/python/commandline_argv/1093)
* [ワークフロー状態バッジの追加](https://docs.github.com/ja/actions/monitoring-and-troubleshooting-workflows/monitoring-workflows/adding-a-workflow-status-badge)
# ライセンスと著作権
・このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可されます.
・このパッケージのコードの一部は、（CC-BY－SA 4.0 by Ryuichi Ueda)のものを、本人の許可を得て自身の著作としたものです。
https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024

・© 2024 Yuta Kannaka

