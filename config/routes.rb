Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/callbacks"
  }
  resources :tasks
  resources :pomodoros, except: [:edit, :update]

  root "tasks#index"
end

