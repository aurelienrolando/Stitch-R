Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index]
  resources :receipts, only: [:index, :update] do
    member do
      get :share
      get :dismiss 
    end
  end
  resources :receivers, only: [:index, :new, :create, :destroy]
  resources :supplier_searches, only: [:index, :show, :new, :create]

  get "/dashboard", to: "pages#dashboard"
  get "/profil", to: "pages#profil"

end
