class LinePageController < ApplicationController
  def top
    
  end

  def group
    if request.get?
      # GETリクエストの処理をここに書く
    elsif request.post?
      if current_user.progress_level <= 2
        group = current_user.line_group
        group.update(chat_1: params[:chat_1])
        # chat_1の文字列に「米松」または「茉莉」が含まれているかを判定
        if current_user.line_group.chat_1&.include?("米松") || current_user.line_group.chat_1&.include?("茉莉")
          current_user.update(progress_level: 3)
        else
          flash[:alert] = "不正解です"
        end
        redirect_to line_page_group_path and return
      end

      if current_user.progress_level <= 3
        group = current_user.line_group
        group.update(chat_2: params[:chat_2])
  
        if current_user.line_group.chat_2 == "キャンペル"
          current_user.update(progress_level: 4)
        else
          flash[:alert] = "不正解です"
        end
        redirect_to line_page_group_path and return
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
      redirect_to line_page_hayato_path and return
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
      
      redirect_to line_page_keisuke_path and return
       end

    end


  end

end
