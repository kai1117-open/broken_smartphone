class BakusaiController < ApplicationController
  def top
    
  end
  def test
    
  end
  def page_1
        # 仮に現在のログインユーザーがいる場合（Devise などを想定）
        current_user_id = current_user.id

        # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
        bakusai = Bakusai.find_or_create_by(user_id: current_user_id)
    
        # `page_1` を `true` に更新
        bakusai.update(page_1: true)
  end
end
