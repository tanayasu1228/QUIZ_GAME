require "./messages"
require "./nazonazo_mode"

class Game

  def initialize(mode, count, data)
    @mode = mode
    @count = count
    @data = data
  end

  def create_game
     @game = @data.shuffle.first(@count)
  end


  def question

    case @mode
    when 1
      @game.each do |game_data|
        puts "問題 ： #{game_data[:question]}"
        answer = gets.chomp
      if answer == game_data[:answer]
          puts '正解です'
      else
          puts '残念' 
          puts "正解は#{game_data[:answer]}でした"
      end
      end
    when 2
      @game.each do |game_data|
        puts "問題 ： #{game_data[:question]}"
        answer = gets.chomp
      if answer == game_data[:answer]
          puts '正解です'
      else
          puts '残念' 
          puts "正解は#{game_data[:answer]}でした"
      end
      end
    end

  end


end

  Messages.start_message

  while
    mode_num = gets.chomp.to_i
    case mode_num
    when 1
      puts "なぞなぞを始めるよ"
    when 2
      puts "わんちゃん知識クイズを始めるよ"
    else
      Messages.error_message
      puts "1 or 2 で選択してね"
      next
    end
    break
  end

  Messages.game_count_message
  while
    count_num = gets.chomp.to_i
    if count_num.between?(1, 10)
    else
      Messages.error_message
      # puts "入力は 1 以上 10 以内で入力してね"
      next
    end
    break
  end


  if mode_num == 1
    content = nazonazo_mode
  elsif mode_num == 2
    content = dog_mode
  end

  game = Game.new(mode_num, count_num, content)
  game.create_game
  correct_count = game.question
  Messages.result_message
