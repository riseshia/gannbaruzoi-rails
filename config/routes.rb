Rails.application.routes.draw do
  resources :pomodoros
  resources :tasks
  devise_for :users, :controllers => { :omniauth_callbacks => "users/callbacks" }

  root "tasks#index"
end

