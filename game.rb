# require "./quiz"
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
    @game = @data.shuffle.first(@count)
  end

  # データ内容に応じて質問＆回答形式を決定させる
  # Quizクラスのfiles_indexにあるplayの番号を読み込んでいる
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

        # quiz = Quiz.new
        # correct_answer = quiz.input_play(game_data, q_num, correct_answer)
        input_play(game_data, q_num, correct_answer)
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

        # quiz = Quiz.new
        # correct_answer = quiz.selection_play(game_data, game_show, show_length, correct_answer)
        selection_play(game_data, game_show, show_length, correct_answer)
        q_num += 1
      end 
      return correct_answer
    end
  end

  # 出題＆回答形式 play when 1 の処理
  def input_play(game_data, q_num, correct_answer)
    in_correct = correct_answer
    while
      answer = gets.chomp
      if answer == game_data[:answer]
        Messages.correct_answer_message
        in_correct += 1

      elsif answer == "hint"
        puts <<~TEXT
        ヒント： #{game_data[:hint]}
        
        問題#{q_num}： #{game_data[:question]}
        ※ 2回目のhintをすると不正解になっちゃうよ！ 頑張って考えてみてね！

         "#{game_data[:sub]}"
         TEXT
        answer = gets.chomp
        if answer == game_data[:answer]
          Messages.correct_answer_message
          in_correct += 1
        else
          puts <<~TEXT

          2回目の hint はできないよ！
          正解は #{game_data[:answer]}でした

          解説： #{game_data[:answer_show]}
          -----------------------------------

          TEXT
        end

      else
          puts <<~TEXT

          残念
          正解は #{game_data[:answer]}でした

          解説： #{game_data[:answer_show]}
          -----------------------------------

          TEXT
      end
      break
    end
      return in_correct
  end

  # 出題＆回答形式 play when 2 の処理
  def selection_play(game_data, game_show, show_length, correct_answer)
    in_correct = correct_answer
    choice = (1..show_length)
    while
      answer = gets.chomp.to_i
      if answer == game_data[:answer_num]
        Messages.correct_answer_message
        in_correct += 1
          
      elsif choice.include?(answer) && answer != game_data[:answer_num]
        puts <<~TEXT

        残念
        正解は #{game_data[:answer]}でした
        -----------------------------------
        

        TEXT

      else
        Messages.error_message
        next
      end
      break
    end
    return in_correct
  end
end
