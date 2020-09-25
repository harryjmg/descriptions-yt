Rails.application.routes.draw do
  get 'credit/index'
  get 'runs/select_videos'
  get 'runs/edit_descriptions'
  get 'runs/publish_changes'
  get 'runs/reload_videos'
  get 'runs/:id/done', to: 'runs#done'

  resources :runs, except: [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home/index'
  get 'home/about'
  get 'home/terms'
  get 'home/privacy'

  root to: "home#index"
end
