Rails.application.routes.draw do

  get 'broken_smartphone/top'
  get 'broken_smartphone/talk_history_1', to: 'broken_smartphone#talk_history_1', as: 'broken_smartphone_talk_history_1'
  


  get 'line_page/top',    to: 'line_page#top',    as: 'line_page_top'
  get 'line_page/group',  to: 'line_page#group',  as: 'line_page_group'
  post 'line_page/group', to: 'line_page#group'
  get 'line_page/hayato',  to: 'line_page#hayato', as: 'line_page_hayato'
  post 'line_page/hayato', to: 'line_page#hayato'
  get 'line_page/keisuke', to: 'line_page#keisuke',as: 'line_page_keisuke'
  post 'line_page/keisuke', to: 'line_page#keisuke'


  get 'google_page/top'
  get 'google_page/index', to: 'google_page#index', as: 'google_page_index'
  get 'google_page/page_1', to: 'google_page#page_1', as: 'google_page_page_1'

  get 'bakusai/top', to: 'bakusai#top', as: 'bakusai_top'
  get 'bakusai/page_1', to: 'bakusai#page_1', as: 'bakusai_page_1'
  get 'bakusai/test', to: 'bakusai#test', as: 'bakusai_test'
  root 'home#index'
  get 'home/dashboard', to: 'home#dashboard'


  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
