

class Game
  # ゲームの生成
  def initialize(style, count, data)
    @style = style
    @count = count
    @data = data
    @game = @data.shuffle.first(@count)
  end

  # データ内容に応じて質問＆回答形式を決定させる
  # Controllerクラスのfiles_indexにあるplayの番号を読み込んでいる
  def play
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

        controller = Controller.new
        correct_answer = controller.answer_style2(game_data, game_show, show_length, correct_answer)
        q_num += 1
      end 
      return correct_answer
    end
  end

end