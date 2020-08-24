Rails.application.routes.draw do

  get 'search/search'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  root 'home#top'
  get 'home/about'
  get 'search' => 'search#search'

  devise_for :users
  resources :users, :only => [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end