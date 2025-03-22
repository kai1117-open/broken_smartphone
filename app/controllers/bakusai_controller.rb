class BakusaiController < ApplicationController
  def top
    
  end

  def page_1
        # 仮に現在のログインユーザーがいる場合（Devise などを想定）
        current_user_id = current_user.id

        # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
        bakusai = Bakusai.find_or_create_by(user_id: current_user_id)
    
        # `page_1` を `true` に更新
        bakusai.update(page_1: true)
  end
  def page_2
    # 仮に現在のログインユーザーがいる場合（Devise などを想定）
    current_user_id = current_user.id

    # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
    bakusai = Bakusai.find_or_create_by(user_id: current_user_id)

    # `page_1` を `true` に更新
    bakusai.update(page_2: true)
    if current_user.progress_level < 5
    current_user.update(progress_level: 5)
    end
  end

  def page_3
    # 仮に現在のログインユーザーがいる場合（Devise などを想定）
    current_user_id = current_user.id

    # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
    bakusai = Bakusai.find_or_create_by(user_id: current_user_id)

    # `page_1` を `true` に更新
    bakusai.update(page_3: true)
end


def page_4
  # 仮に現在のログインユーザーがいる場合（Devise などを想定）
  current_user_id = current_user.id

  # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
  bakusai = Bakusai.find_or_create_by(user_id: current_user_id)

  # `page_1` を `true` に更新
  bakusai.update(page_4: true)
end

def page_5
  # 仮に現在のログインユーザーがいる場合（Devise などを想定）
  current_user_id = current_user.id

  # `user_id` に対応する `Bakusai` レコードを探す（なければ作成）
  bakusai = Bakusai.find_or_create_by(user_id: current_user_id)

  # `page_1` を `true` に更新
  bakusai.update(page_5: true)
end

end
