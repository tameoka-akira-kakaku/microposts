Rails.application.routes.draw do
  root to: 'static_pages#home'
  get       'signup', to: 'users#new'
  get       'login' , to: 'sessions#new'
  post      'login' , to: 'sessions#create'
  delete    'logout', to: 'sessions#destroy'
  
  get       'settings' , to: 'users#edit'
  post      'settings' , to: 'users#update'
  
# get       'followings' , to: 'users#followings'
# get       'followers' , to: 'users#followers'


  
  resources :users, except: [:edit]  do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :microposts do
    member do
      get :retweet
    end
  end  
  
  resources :relationships, only: [:create, :destroy]
end