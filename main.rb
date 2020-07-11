require "./messages"
require "./controller"
require "./nazo_easy_mode"
require "./nazo_hard_mode"
require "./dog_mode"
require "./anime_mode"
require "./ruby_mode"

class Game
  # ゲームの生成
  def initialize(style, count, data)
    @style = style
    @count = count
    @data = data
  end

  # 選択されたデータをシャッフルして、データの先頭から問題数を取得
  def create_game
     @game = @data.shuffle.first(@count)
  end

  # データ内容に応じて質問＆回答形式を決定させる
  # Controllerクラスのfiles_indexにあるquestion_styleの番号を読み込んでいる
  def question_style
    q_num = 1
    correct_answer = 0
    case @style
    # 回答方法は入力形式で処理
    when 1
      @game.each do |game_data|
        puts <<~TEXT
        問題#{q_num}： #{game_data[:question]}
        ※ ヒントが必要なら hint と入力してね！
        
        #{game_data[:sub]}
        TEXT

        # コントローラを生成
        controller = Controller.new
        correct_answer = controller.answer_style1(game_data, q_num, correct_answer)
        q_num += 1
      end
      return correct_answer

    # 回答方法は番号選択形式で処理
    when 2
      puts "問題#{q_num}："
      @game.each do |game_data|
        puts "#{game_data[:question]}"
        game_show = game_data.values
        game_show.shift
        game_show.pop
        # データの数に応じて選択数の表示を変更させる為の変数を定義
        show_length = game_show.length
        puts <<~TEXT

        #{show_length}択から選んでね
        TEXT
        game_show.each.with_index(1) do |show,i|
          puts "#{i} ： #{show}"
        end
        # コントローラを生成
        controller = Controller.new
        correct_answer = controller.answer_style2(game_data, game_show, show_length, correct_answer)
        q_num += 1
      end 
      return correct_answer
    end
  end

end


# コントローラーを生成
controller = Controller.new
# ゲーム選択画面 一覧を取得＆表示
index = controller.contents_index
Messages.start_message(index)

# 入力データに応じてインデックス番号を取得
@i = controller.contents
i = @i

# 読み込むファイルデータを決定＆変数に格納
file = controller.files_index
# ファイル内の数を取得＆変数に格納
data_length = file.length
# 質問＆回答形式を決定して変数に格納
style = controller.style_inspect
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
content_name = controller.content
Messages.content_name_message(content_name)

# ゲームの生成
game = Game.new(style, count_num, file)
game.create_game

# 正解数を結果として表示
correct_count = game.question_style
Messages.result_message(count_num, correct_count)