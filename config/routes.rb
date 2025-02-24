Rails.application.routes.draw do

  get 'broken_smartphone/top'

  get 'line_page/top'

  get 'google_page/top'

  get 'bakusai/top'
  
  root 'home#index'
  get 'home/dashboard', to: 'home#dashboard'


  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
