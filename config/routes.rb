Rails.application.routes.draw do
  get 'run/select_videos'
  get 'run/edit_descriptions'
  get 'run/publish_changes'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home/index'
  get 'home/about'
  get 'home/terms'
  get 'home/privacy'

  root to: "home#index"
end
