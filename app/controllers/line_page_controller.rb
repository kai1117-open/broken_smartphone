class LinePageController < ApplicationController
  def top
    
  end

  def group

  end

  def hayato
    if request.get?



    elsif request.post?

      if current_user.progress_level == 1
      hayato = current_user.hayato
      hayato.update(chat_1: params[:chat_1])
      if current_user.hayato.chat_1&.include?("メール") || current_user.hayato.chat_1&.include?("写真")
        current_user.update(progress_level: 2)
        redirect_to line_page_hayato_path
      else
        flash[:alert] = "不正解です" 
        redirect_to line_page_hayato_path
      end
      end

    end
  end


  def keisuke
    if current_user.progress_level == 0
      current_user.update(progress_level: 1)
    end
  end

end
