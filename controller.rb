
class Controller

  # ゲーム追加手順
  # 1. 問題データを別途作成(requireを忘れずに)
  # 2. @index配列内の下へ名称を追加
  # 3. contentsメソッドへ" when 番号" と"content"を追記
  # files_indexメソッドへデータファイル名、質問表示形式番号（question_styleメソッドのwhen番号になる）を記述する
  
  # ゲーム選択画面 一覧
  def contents_index
    @index = [
      "【遊び】やさしい なぞなぞ",
      "【遊び】鬼難 なぞなぞ",
      "【遊び】わんちゃん知識クイズ",
      "【遊び】アニメ知識クイズ",
      "【学習】RUBY メソッド選択クイズ（間違っていたらごめんなさい）"
    ]
    return @index
  end

  # ファイルの一覧を生成（ゲーム選択画面 一覧の順番とする）
  def files_index
    @files = [
      {file_name: nazo_easy_mode, question_style: 1},
      {file_name: nazo_hard_mode, question_style: 1},
      {file_name: dog_mode, question_style: 2},
      {file_name: anime_mode, question_style: 2},
      {file_name: ruby_mode, question_style: 2}

    ]
    # ハッシュ内の:file_nameを配列として格納
    files_data = @files.map { |f| f[:file_name]}
    # 配列から取得したいファイルデータをインデックス番号によって決定
    file = files_data[@i]
    return file
  end

  # 質問＆回答形式を決定させる
  def style_inspect
    # ハッシュ内の:question_styleを配列として格納
    style_data = @files.map { |s| s[:question_style]}
    # 配列から取得したいquestion_styleをインデックス番号によって決定
    style = style_data[@i]
    return style
  end

  # 入力データに応じてインデックス番号を取得
  def contents
    while
      format_num = gets.chomp.to_i
      @i = format_num -1
      case format_num
      when 1
        content
      when 2
        content
      when 3
        content
      when 4
        content
      when 5
        content
      else
        Messages.error_message
        next
      end
      return @i
      break
    end
  end

  # インデックス番号に対して選択したゲーム名を取得
  def content
    content_name = @index[@i]
    return content_name
  end

  # 出題＆回答形式 question_style when 1 の処理
  def answer_style1(game_data, q_num, correct_answer)
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

  # 出題＆回答形式 question_style when 2 の処理
  def answer_style2(game_data, game_show, show_length, correct_answer)
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

