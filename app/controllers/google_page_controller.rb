class GooglePageController < ApplicationController
  def top
    # トップページ用の処理があればここに記述
  end

  def index
    @query = extract_query
    return set_empty_results if @query.empty?

    @search_results = fetch_search_results(@query)
  end

  def page_1
    google = Google.find_or_create_by(user_id: current_user.id)
    google.update(page_1: true)
  end


  def page_2
    google = Google.find_or_create_by(user_id: current_user.id)
    google.update(page_2: true)
  end


  def page_3
    google = Google.find_or_create_by(user_id: current_user.id)
    google.update(page_3: true)
  end


  def page_4
    google = Google.find_or_create_by(user_id: current_user.id)
    google.update(page_4: true)
  end

  private

  # クエリ文字列を正規化して取得
  def extract_query
    params[:q].to_s.strip.downcase
  end

  # クエリが空の場合の検索結果を設定
  def set_empty_results
    @search_results = []
  end

  # 特定キーワードと対応する検索結果の一覧を返す
  def keyword_results
    {
      "セラヴィ" => [
        { title: "セラヴィの人気嬢に対するスレ", path: bakusai_page_1_path }
      ],
      "片町経営者10選" => [
        { title: "片町経営者10選インタビュー記事", path: google_page_page_1_path }
      ],
      "魚盛の酒場" => [
        { title: "魚盛の酒場に行ったことあるヤツ集合", path: bakusai_page_2_path }
      ],
      "瀬戸ビル" => [
        { title: "瀬戸ビルの常連あつまれ", path: bakusai_page_3_path }
      ],
      "加納卓也" => [
        { title: "闇の財産？噂のビルを調査してみた", path: google_page_page_2_path }
      ],
      "米松文也" => [
        { title: "いま片町で1番調子にのってる奴", path: bakusai_page_4_path }
      ]
    }
  end

  # クエリに部分一致するキーワードを検索し、結果を返す
  def fetch_search_results(query)
    results = keyword_results.select { |key, _| key.include?(query) || query.include?(key) }
                              .values.flatten
    results.empty? ? [{ title: "検索結果が見つかりませんでした", path: "" }] : results
  end
end
