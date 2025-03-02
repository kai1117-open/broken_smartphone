class GooglePageController < ApplicationController
  def top
    
  end

  def index
    @query = params[:q].to_s.strip.downcase  # 空白のみの検索を防ぐ
  
    # 検索ワードが空の場合は検索を実行しない
    if @query.empty?
      @search_results = []
      return
    end
  
    # 特定ワードごとの検索結果（部分一致対応）
    results = {
      "セラヴィ" => [
        { title: "セラヴィの人気嬢に対するスレ", path: bakusai_page_1_path }
      ],
      "片町経営者10選" => [
        { title: "片町経営者10選インタビュー記事", path: google_page_page_1_path }
      ],
      "魚盛の酒場" => [
        { title: "レアアイテム発見！", path: google_page_top_path }
      ]
    }
  
    # 部分一致するキーワードを検索
    @search_results = results.select { |key, _| key.include?(@query) || @query.include?(key) }.values.flatten
  
    # 一致しない場合はデフォルト検索結果
    @search_results = [{ title: "検索結果が見つかりませんでした", path: "" }] if @search_results.empty?
  end
  
  def page_1
        # 仮に現在のログインユーザーがいる場合（Devise などを想定）
        current_user_id = current_user.id

        # `user_id` に対応する `google` レコードを探す（なければ作成）
        google = Google.find_or_create_by(user_id: current_user_id)
    
        # `page_1` を `true` に更新
        google.update(page_1: true)
  end
  

end
