Rails.application.routes.draw do
  get 'orders/create'
  get 'orders/show'
  get 'carts/create'
  devise_for :users
  root "packs#index"
  resources :packs, only: [:index, :show]
  resources :carts, only: [:create, :index, :destroy]
  resources :orders, only: [:create, :show, :index]
  get 'home/index'
  get "/mypage" => "home#mypage"


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
