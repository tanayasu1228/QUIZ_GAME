class Quiz

  def contents_display
    @contents_index = [
      "【遊び】やさしい なぞなぞ",
      "【遊び】鬼難 なぞなぞ",
      "【遊び】わんちゃん知識クイズ",
      "【遊び】アニメ知識クイズ",
      "【学習】RUBY メソッド選択クイズ（間違っていたらごめんなさい）"
    ]
  end

  # ファイルの一覧を生成（ゲーム選択画面 一覧の順番とする）
  def files_index
    @files = [
      {file_name: nazo_easy_mode, play: 1},
      {file_name: nazo_hard_mode, play: 1},
      {file_name: dog_mode, play: 2},
      {file_name: anime_mode, play: 2},
      {file_name: ruby_mode, play: 2}

    ]
    # ハッシュ内の:file_nameを配列として格納
    files_data = @files.map { |f| f[:file_name]}
    # 配列から取得したいファイルデータをインデックス番号によって決定
    quiz_file = files_data[@i]
  end

  # 質問＆回答形式を決定させる
  def play_format_check
    # ハッシュ内の:playを配列として格納
    style_data = @files.map { |s| s[:play]}
    # 配列から取得したいplayをインデックス番号によって決定
    quiz_style = style_data[@i]
  end

  # 入力データに応じてインデックス番号を取得
  def contents
    while
      content_num = gets.chomp.to_i
      @i = content_num -1
      if content_num.between?(1, @contents_index.length)
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
    content_name = @contents_index[@i]
  end

end