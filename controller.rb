
class Controller

  # ゲーム追加手順
  # 1. 問題データを別途作成(requireを忘れずに)
  # 2. @index配列内の下へ名称を追加
  # 3. contentsメソッドへ" when 番号" と"content"を追記
  # files_indexメソッドへデータファイル名、質問表示形式番号（question_styleメソッドのwhen番号になる）を記述する
  
  def contents_index
    @index = [
      "【遊び】なぞなぞ",
      "【遊び】わんちゃん知識クイズ",
      "【遊び】アニメ知識クイズ",
      "【学習】RUBY 虫食いコード"
    ]
    return @index
  end

  def files_index
    @files = [
      {file_name: nazonazo_mode, question_style: 1},
      {file_name: dog_mode, question_style: 1},
      {file_name: anime_mode, question_style: 2},
      {file_name: english_mode, question_style: 2}

    ]
    files_data = @files.map { |f| f[:file_name]}
    file = files_data[@i]
    return file
  end

  def style_inspect
    style_data = @files.map { |s| s[:question_style]}
    style = style_data[@i]
    return style
  end

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
      else
        Messages.error_message
        next
      end
      return @i
      # return format_num, @i
      break
    end
  end

  def content
    content_name = @index[@i]
    return content_name
  end


end

