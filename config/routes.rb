Rails.application.routes.draw do

  devise_for :users

  resources :groups, only: [:show] do
    resources :swappers, only: [:create, :edit, :update]
  end

  post '/groups/:id/scramble', to: 'groups#scramble', as: "group_scramble"
  post '/groups/:id/email_blast', to: 'groups#email_blast', as: "email_blast"

  root to: "home#index"
end
