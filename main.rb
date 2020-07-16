require "./messages"
require "./quiz"
require "./game"
require "./data"


require "./nazo_easy_mode"
require "./nazo_hard_mode"
require "./dog_mode"
require "./anime_mode"
require "./ruby_mode"

quiz = Quiz.new

# ゲーム選択画面を表示
selected_quiz = quiz.contents_display
Messages.start_message(selected_quiz)

# 入力データに応じてインデックス番号を取得
format_index_num = quiz.contents

# 読み込むファイルデータを決定＆変数に格納
quiz_file = quiz.files_index
# ファイル内の数を取得＆変数に格納
data_length = quiz_file.length
# 質問＆回答形式を決定して変数に格納
quiz_style = quiz.play_format_check
Messages.game_count_message(selected_quiz, format_index_num, data_length)

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
game = Game.new(quiz_style, count_num, quiz_file)

# 正解数を結果として表示
correct_count = game.play
Messages.result_message(count_num, correct_count)