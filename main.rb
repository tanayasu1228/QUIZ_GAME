require "./messages"
require "./quiz"
require "./game"
# require "./data"
require "./nazo_easy_mode"
require "./nazo_hard_mode"
require "./dog_mode"
require "./anime_mode"
require "./ruby_mode"

quiz = Quiz.new
# ゲーム選択画面 一覧を取得＆表示
index = quiz.contents_index
Messages.start_message(index)

# 入力データに応じてインデックス番号を取得
@i = quiz.contents
i = @i

# 読み込むファイルデータを決定＆変数に格納
file = quiz.files_index
# ファイル内の数を取得＆変数に格納
data_length = file.length
# 質問＆回答形式を決定して変数に格納
style = quiz.style_inspect
Messages.game_count_message(index, i, data_length)

# 問題数の選択
while
  count_num = gets.chomp.to_i
  if count_num.between?(1, data_length)
  else
    Messages.error_message
    next
  end
  break
end

# インデックス番号に対して選択したゲーム名を取得＆表示
content_name = quiz.content
Messages.content_name_message(content_name)

# ゲームの生成
game = Game.new(style, count_num, file)

# 正解数を結果として表示
correct_count = game.play
Messages.result_message(count_num, correct_count)