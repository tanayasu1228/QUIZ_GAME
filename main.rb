require "./messages"
require "./nazonazo_mode"
require "./dog_mode"
require "./controller"

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
    q_num = 1
    correct_answer = 0
    case @mode
    when 1
      @game.each do |game_data|
        puts "問題NO.#{q_num}： #{game_data[:question]}"
        answer = gets.chomp
      if answer == game_data[:answer]
          puts '正解です'
          correct_answer += 1
      else
          puts '残念' 
          puts "正解は#{game_data[:answer]}でした"
      end
      q_num += 1
      end
      return correct_answer

    when 2
      @game.each do |game_data|
        puts "問題NO.#{q_num}： #{game_data[:question]}"
        answer = gets.chomp
      if answer == game_data[:answer]
          puts '正解です'
          correct_answer += 1
      else
          puts '残念' 
          puts "正解は#{game_data[:answer]}でした"
      end
      q_num += 1
      end
      return correct_answer
    end

  end


end








  Messages.start_message
  controller = Controller.new
  controller.contents_index
  mode_num = controller.contents

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
  Messages.result_message(count_num, correct_count)
