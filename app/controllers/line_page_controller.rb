class LinePageController < ApplicationController
  def top
    
  end

  def group
    if request.get?

    elsif request.post?
      if current_user.progress_level == 2
        group = current_user.line_group
        group.update(chat_1: params[:chat_1])
        if current_user.line_group.chat_1&.include?("メール") || current_user.line_group.chat_1&.include?("写真")
          current_user.update(progress_level: 3)
        else
          flash[:alert] = "不正解です" 
        end
        redirect_to line_page_group_path
        end
    end
  end

  def hayato
    if request.get?



    elsif request.post?

      if current_user.progress_level == 1
      hayato = current_user.hayato
      hayato.update(chat_1: params[:chat_1])
      if current_user.hayato.chat_1&.include?("メール") || current_user.hayato.chat_1&.include?("写真")
        current_user.update(progress_level: 2)
      else
        flash[:alert] = "不正解です" 
      end
      redirect_to line_page_hayato_path
      end

    end
  end


  def keisuke
    if request.get?


      if current_user.progress_level == 0
        current_user.update(progress_level: 1)
      end


    elsif request.post?


      if current_user.progress_level >= 1
        keisuke = current_user.keisuke
        keisuke.update(chat_1: params[:chat_1])
      end
      redirect_to line_page_keisuke_path


    end


  end

end
