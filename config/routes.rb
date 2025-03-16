Rails.application.routes.draw do

  get 'broken_smartphone/top'
  get 'broken_smartphone/talk_history_1', to: 'broken_smartphone#talk_history_1', as: 'broken_smartphone_talk_history_1'
  get 'broken_smartphone/talk_history_2', to: 'broken_smartphone#talk_history_2', as: 'broken_smartphone_talk_history_2'
  get 'broken_smartphone/hotograph_history_1', to: 'broken_smartphone#hotograph_history_1', as: 'broken_smartphone_hotograph_history_1'
  get 'broken_smartphone/memo_history_1', to: 'broken_smartphone#memo_history_1', as: 'broken_smartphone_memo_history_1'


  get 'line_page/top',    to: 'line_page#top',    as: 'line_page_top'
  get 'line_page/history',    to: 'line_page#history',    as: 'line_page_history'
  get 'line_page/group',  to: 'line_page#group',  as: 'line_page_group'
  post 'line_page/group', to: 'line_page#group'
  get 'line_page/hayato',  to: 'line_page#hayato', as: 'line_page_hayato'
  post 'line_page/hayato', to: 'line_page#hayato'
  get 'line_page/keisuke', to: 'line_page#keisuke',as: 'line_page_keisuke'
  post 'line_page/keisuke', to: 'line_page#keisuke'


  get 'google_page/top'
  get 'google_page/index', to: 'google_page#index', as: 'google_page_index'
  get 'google_page/page_1', to: 'google_page#page_1', as: 'google_page_page_1'
  get 'google_page/page_2', to: 'google_page#page_2', as: 'google_page_page_2'
  get 'google_page/page_3', to: 'google_page#page_3', as: 'google_page_page_3'
  get 'google_page/page_4', to: 'google_page#page_4', as: 'google_page_page_4'
  get 'google_page/page_5',  to: 'google_page#page_5',   as: 'google_page_page_5'
  get 'google_page/page_6',  to: 'google_page#page_6',   as: 'google_page_page_6'
  get 'google_page/page_7',  to: 'google_page#page_7',   as: 'google_page_page_7'
  get 'google_page/page_8',  to: 'google_page#page_8',   as: 'google_page_page_8'
  get 'google_page/page_9',  to: 'google_page#page_9',   as: 'google_page_page_9'
  get 'google_page/page_10', to: 'google_page#page_10',  as: 'google_page_page_10'
  get 'google_page/page_11', to: 'google_page#page_11',  as: 'google_page_page_11'

  get 'bakusai/top', to: 'bakusai#top', as: 'bakusai_top'
  get 'bakusai/page_1', to: 'bakusai#page_1', as: 'bakusai_page_1'
  get 'bakusai/page_2', to: 'bakusai#page_2', as: 'bakusai_page_2'
  get 'bakusai/page_3', to: 'bakusai#page_3', as: 'bakusai_page_3'
  get 'bakusai/page_4', to: 'bakusai#page_4', as: 'bakusai_page_4'
  get 'bakusai/page_5',  to: 'bakusai#page_5',   as: 'bakusai_page_5'
  get 'bakusai/page_6',  to: 'bakusai#page_6',   as: 'bakusai_page_6'
  get 'bakusai/page_7',  to: 'bakusai#page_7',   as: 'bakusai_page_7'
  get 'bakusai/page_8',  to: 'bakusai#page_8',   as: 'bakusai_page_8'
  get 'bakusai/page_9',  to: 'bakusai#page_9',   as: 'bakusai_page_9'
  get 'bakusai/page_10', to: 'bakusai#page_10',  as: 'bakusai_page_10'
  get 'bakusai/page_11', to: 'bakusai#page_11',  as: 'bakusai_page_11'

  root 'home#index'
  get 'home/dashboard', to: 'home#dashboard'


  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
