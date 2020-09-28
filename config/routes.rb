Rails.application.routes.draw do
  get 'credit/index'
  get 'runs/select_videos'
  get 'runs/reload_videos'

  get 'runs/:id/edit_descriptions', to: "runs#edit_descriptions", as: "runs_edit_descriptions"
  get 'runs/:id/publish_changes', to: "runs#publish_changes", as: "runs_publish_changes"

  get 'runs/:id/done', to: 'runs#done', as: "runs_done"
  get 'runs/:id/publish_changes_online', to: 'runs#publish_changes_online', as: "runs_publish_changes_online"

  resources :runs, except: [:show]

  resources :charges

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'home/index'
  get 'home/about'
  get 'terms', to: "home#terms"
  get 'privacy', to: "home#privacy"

  root to: "home#index"
end
