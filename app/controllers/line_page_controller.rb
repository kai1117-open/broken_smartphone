class LinePageController < ApplicationController
  def top
    
  end
  def group

  end
  def hayato

  end
  def keisuke
    if current_user.progress_level == 0
      current_user.update(progress_level: 1)
    end
  end
end
