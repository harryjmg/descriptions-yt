Rails.application.routes.draw do
  get 'run/select_videos'
  get 'run/edit_descriptions'
  get 'run/publish_changes'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
