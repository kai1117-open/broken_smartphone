class BrokenSmartphoneController < ApplicationController
  def top
  end

  def talk_history_1

  end

  def talk_history_2

  end

  def photograph_history_1

  end

  def memo_history_1
    if current_user.progress_level < 9
    current_user.update(progress_level: 9)
    end
  end
end
