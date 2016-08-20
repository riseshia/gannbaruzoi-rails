Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/callbacks"
  }
  resources :tasks do
    patch :log, on: :member
  end
  resources :pomodoros, only: [:index, :destroy]

  root "tasks#index"
end

