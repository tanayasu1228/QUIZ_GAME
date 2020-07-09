module Messages

  module_function

  def start_message
    puts <<~TEXT
    --------  QUIZ 選択  --------
    1 ： なぞなぞ
    2 ： わんちゃん知識クイズ

    ※ 何で遊びますか？
       1 or 2 で選んでね！
    --------    --------
    TEXT
  end

  def quiz_name_message(quiz_name)
    puts "#{quiz_name}を始めるよ"
  end

  

  def game_count_message
    puts <<~TEXT

    なぞなぞの数は 1 ~ 10 問の間で選べるよ！
    ※ 1 ~ 10 の数字を入力してね！

    TEXT
    
  end

  def result_message(count, correct)
    puts <<~TEXT

              【 正解数の発表 】  
    #{count} 問中 #{correct} 問 正解でした！

    ゲーム終了
    TEXT
  end

  def error_message
    puts <<~TEXT
    ------------------------------------
    error :  不適切な入力です
             半角数字で再度入力して下さい
    TEXT
  end

end
