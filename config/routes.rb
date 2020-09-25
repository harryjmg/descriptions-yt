Rails.application.routes.draw do
  get 'credit/index'
  get 'runs/select_videos'
  get 'runs/edit_descriptions'
  get 'runs/publish_changes'
  get 'runs/reload_videos'
  get 'runs/:id/done', to: 'runs#done', as: "runs_done"
  get 'runs/:id/publish_changes_online', to: 'runs#publish_changes_online', as: "runs_publish_changes_online"

  resources :runs, except: [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home/index'
  get 'home/about'
  get 'home/terms'
  get 'home/privacy'

  root to: "home#index"
end
