Rails.application.routes.draw do

  devise_for :users

  resources :groups, only: [:show] do
    resources :swappers, only: [:create, :edit, :update]
  end

  root to: "home#index"
end
