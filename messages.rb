module Messages

  module_function

  def start_message(selected_quiz)
    puts <<~TEXT

    ==========  QUIZ 選択  ==========
    
    TEXT
    selected_quiz.each.with_index(1) do |quiz_name, i|
      puts "#{i} ： #{quiz_name}"
    end
    puts <<~TEXT

    ※ 何で遊びますか？番号を入力してね！
    =================================
    TEXT

  end

  def content_name_message(content_name)
    puts <<~TEXT
    #{content_name}を始めるよ

    -----------------------------------
    TEXT
  end

  def game_count_message(content_name, i, data_length)
    puts <<~TEXT

    #{content_name[i]}の問題数は 全部で#{data_length}問まで選択できるよ！
    ※ やりたい問題数を数字で入力してね！


    TEXT
  end

  def correct_answer_message
    puts <<~TEXT

    正解！
    -----------------------------------
    
    TEXT
  end

  def result_message(count, correct)
    puts <<~TEXT

    ========== 【 正解数の発表 】 ==========
    #{count} 問中 #{correct} 問 正解でした！

    おつかれさまでした！ゲーム終了
    ========================================
    TEXT
  end

  def error_message
    puts <<~TEXT

    error :  不適切な入力です
             半角数字で再度入力して下さい

    TEXT
  end

end
