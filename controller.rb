
class Controller

  def contents_index
    @index = [
      "なぞなぞ",
      "わんちゃん知識クイズ",
      "【小学校問題】この漢字読めるかな？クイズ",
      "【中学校問題】この漢字読めるかな？クイズ",
    ]
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
      return mode_num
      break
    end
  end

  def content
    content_name = @index[@i]
    Messages.content_name_message(content_name)
  end



end

