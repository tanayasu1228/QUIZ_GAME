require "./messages"
require "./controller"
require "./nazonazo_mode"
require "./dog_mode"
require "./anime_mode"
require "./english_mode"

class Game

  def initialize(style, count, data)
    @style = style
    @count = count
    @data = data
  end

  def create_game
     @game = @data.shuffle.first(@count)
  end


  def question_style
    q_num = 1
    correct_answer = 0
    # key = @game.keys
    # hint = key[1]
    case @style
    when 1
      @game.each do |game_data|
        puts "問題#{q_num}： #{game_data[:question]}"
        puts "※ ヒントが必要なら hint と入力してね！"
        answer = gets.chomp
      if answer == game_data[:answer]
        puts <<~TEXT

        正解！
        -----------------------------------

        TEXT
        correct_answer += 1

      elsif answer == "hint"
        puts "ヒント： #{game_data[:hint]}"
        puts ""
        puts "問題#{q_num}： #{game_data[:question]}"
        puts <<~TEXT
        ※ 2回目のhintをすると不正解になっちゃうよ！
        頑張って考えてみてね！
        TEXT

        answer = gets.chomp
        if answer == game_data[:answer]
          puts <<~TEXT

          正解！
          -----------------------------------

          TEXT
          correct_answer += 1
        else
          puts <<~TEXT

          残念
          正解は#{game_data[:answer]}でした
          -----------------------------------

          TEXT
        end

      else
          puts <<~TEXT

          残念
          正解は#{game_data[:answer]}でした
          -----------------------------------

          TEXT
      end
      q_num += 1
      end
      return correct_answer

    when 2
      puts "問題#{q_num}："
      @game.each do |game_data|
        puts "#{game_data[:question]}"
        game_show = game_data.values
        game_show.shift
        game_show.pop
        show_length = game_show.length
        puts "#{show_length}択から選んでね"
        game_show.each.with_index(1) do |show,i|
          puts "#{i} ： #{show}"
        end
        answer = gets.chomp.to_i
      if answer == game_data[:answer_num]
          puts <<~TEXT
          正解！
          -----------------------------------
          TEXT
          correct_answer += 1
      else
          puts "残念" 
          puts "正解は#{game_data[:answer]}でした"
      end
      q_num += 1
      end
      return correct_answer
    end

  end


end







  controller = Controller.new
  index = controller.contents_index

  Messages.start_message(index)
  # format_num, @i = controller.contents
  @i = controller.contents
  i = @i

  file = controller.files_index
  data_length = file.length

  style = controller.style_inspect

  Messages.game_count_message(index, i, data_length)

  while
    count_num = gets.chomp.to_i
    if count_num.between?(1, data_length)
    else
      Messages.error_message
      next
    end
    break
  end
  content_name = controller.content
  Messages.content_name_message(content_name)


  game = Game.new(style, count_num, file)
  game.create_game
  correct_count = game.question_style
  Messages.result_message(count_num, correct_count)
