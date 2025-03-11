class LinePageController < ApplicationController
  before_action :set_user, only: [:keisuke, :hayato, :group]

  def top
    # トップページの処理が必要なら記述
  end

  # keisukeアクション
  # GETリクエスト時に進捗レベル0ならレベル1に更新
  # POSTリクエスト時はchat_1を更新（この例では検証処理はなし）
  def keisuke
    if request.get?
      if @user.progress_level == 0
        @user.update(progress_level: 1)
      end
    elsif request.post?
      if @user.progress_level == 1
        @user.keisuke.update(chat_1: params[:chat_1])
      end
      redirect_to line_page_keisuke_path and return
    end
  end

  # hayatoアクション
  # POSTリクエスト時に進捗レベル1の場合、chat_1を更新し検証後、進捗レベルを2に更新
  def hayato
    if request.post? && @user.progress_level == 1
      @user.hayato.update(chat_1: params[:chat_1])
      if valid_hayato?(@user.hayato.chat_1)
        @user.update(progress_level: 2)
      else
        flash[:alert] = "不正解です"
      end
      redirect_to line_page_hayato_path and return
    end
  end

  # groupアクション
  # 進捗レベルに応じた処理をcase文で分岐
  def group
    if request.get?
      # GETリクエスト時の処理があれば記述
    elsif request.post?
      case @user.progress_level
      when 2
        # 進捗レベル2：chat_1の入力検証（「米松」または「茉莉」を含むか）
        process_group_step(:chat_1, params[:chat_1], ->(input){ input.include?("米松") || input.include?("茉莉") }, 3)
      when 3
        # 進捗レベル3：chat_2の入力検証（"キャンペル"と一致するか）
        process_group_step(:chat_2, params[:chat_2], ->(input){ input == "キャンペル" }, 4)
      when 5
        # 進捗レベル5：chat_4の入力検証（例：期待する値と一致するか）
        process_group_step(:chat_3, params[:chat_3], ->(input){ input.include?("例のキーワード") }, 6)
      when 6
        # 進捗レベル6：chat_5の入力検証（例：正規表現で判定）
        process_group_step(:chat_4, params[:chat_4], ->(input){ input.include?("例のキーワード") }, 7)
      when 7
        # 進捗レベル7：chat_6の入力検証（例：複数のキーワードを含むか）
        process_group_step(:chat_5, params[:chat_5], ->(input){ input.include?("例のキーワード") }, 8)
      when 8
        # 進捗レベル8：chat_7の入力検証（例：特定の文字列で始まるか）
        process_group_step(:chat_6, params[:chat_6], ->(input){ input.include?("例のキーワード") }, 9)
      when 9
        # 進捗レベル9：chat_8の入力検証（例：特定の文字列で終わるか）
        process_group_step(:chat_7, params[:chat_7], ->(input){ input.include?("例のキーワード") }, 10)
      when 10
        # 進捗レベル10：chat_9の入力検証（例：最終キーワードを含むか）
        process_group_step(:chat_8, params[:chat_8], ->(input){ input.include?("例のキーワード") }, 11)
      when 11
        # 拡張性していく
        process_group_step(:chat_9, params[:chat_9], ->(input){ input.include?("例のキーワード") }, 12)
      else
        flash[:alert] = "無効な状態です"
      end
      redirect_to line_page_group_path and return
    end
  end

  private

  # hayatoの入力検証用メソッド（「メール」または「写真」を含むかどうか）
  def valid_hayato?(input)
    input.include?("メール") || input.include?("写真")
  end

  # groupアクションの各ステップ処理を共通化するヘルパーメソッド
  # field: 更新対象の属性、value: パラメータ、validation_proc: 検証用Proc、next_level: 正解時に更新する進捗レベル
  def process_group_step(field, value, validation_proc, next_level)
    group = @user.line_group
    group.update(field => value)
    if validation_proc.call(group.send(field))
      @user.update(progress_level: next_level)
    else
      flash[:alert] = "不正解です"
    end
  end

  def set_user
    @user = current_user
  end
end
