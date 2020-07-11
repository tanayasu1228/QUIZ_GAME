# はじめに

Rubyだけを使ったクイズ形式のゲームアプリです


## 各ファイルの説明

- main.rb ： 実行プログラム
- controller.rb ： 選択されたゲームに応じて必要な処理をmain.rbへ渡す
- messages.rb ： 処理内容のメッセージを出力するモジュール

  下記は各クイズのデータが格納されている
- nazo_easy_mode.rb ： なぞなぞ（easyモード）の初期データ
- nazo_hard_mode.rb ： なぞなぞ（hardモード）の初期データ
- dog_mode.rb ： 犬の知識クイズの初期データ
- anime_mode.rb ： アニメクイズの初期データ
- ruby_mode.rb ： RUBYクイズの初期データ 


## 制作にあたって意識した箇所

- 回答方式を変える際、クイズデータを読み込んだら内容に応じて実行プログラムが変わるようにしました。
- ゲームのデータを追加した場合に、修正箇所を最低限にしたかったので互換性のあるプログラムを目指しました。


## ゲームの進め方

1. ターミナルで実行します。アプリのディレクトリ上で`ruby main.rb`を実行。
2. 画面のメッセージに従って、ゲーム選択から回答、終了まで順に進みます。


## ゲームの問題数

データファイル内のデータ数を読み込んでいるので、各データ事に問題数の表示が変わります。


## インストール方法

 ```
- ターミナルで行ってください
$ git clone https://github.com/tanayasu1228/QUIZ_GAME.git
$ cd QUIZ_GAME
$ ruby main.rb
 ```


## 製作者

棚橋 靖弘
Twitter ：@tanahashi_yasu   [https://twitter.com/tanahashi_yasu]
