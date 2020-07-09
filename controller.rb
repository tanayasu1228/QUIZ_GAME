
class Controller

  # ゲーム追加手順
  # 1. 問題データを別途作成
  # 2. @index配列内の下へ名称を追加
  # 3. contentsメソッドへ" when 番号" と"content"を追記

  
  def contents_index
    @index = [
      "なぞなぞ",
      "わんちゃん知識クイズ",
      "【小学校問題】この漢字読めるかな？",
      "【中学校問題】この漢字読めるかな？"
    ]
    return @index
  end

  def files_index
    @files = [
      nazonazo_mode,
      dog_mode
      
    ]
    file = @files[@i]
    return file
  end

  def contents
    while
      mode_num = gets.chomp.to_i
      @i = mode_num -1
      case mode_num
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
      return mode_num, @i
      break
    end
  end

  def content
    content_name = @index[@i]
    Messages.content_name_message(content_name)
  end



end

