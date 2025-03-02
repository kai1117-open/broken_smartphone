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
        { title: "謎解きのヒント", path: google_page_top_path }
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
  
  
  

end
