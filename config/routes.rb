Surfeitalpha::Application.routes.draw do


  get '/' => 'pages#index', :as => :index

  get '/login' => 'sessions#login', :as => :login
  post '/sessions/create' => 'sessions#create_surfeit'
  match 'auth/:provider/callback', to: 'sessions#create_twitter'
  
  #users

  resources :users
  resource :account
  match 'account'  => 'users#show'

  get '/current' => 'pages#current', :as => :user_current

  #Social Channels

  resources :channels
  get 'channels/twitter' => 'channels#twitter', :as => :twitter
  get 'channels/facebook' => 'channels#facebook', :as => :facebook
 #get 'channels/instagram' => 'channels#instagram', :as => :instagram
  

    # root :to => 'Directors#index'  DO THIS
 
  get '/sessions/logout' => 'sessions#destroy', :as => :logout
  

end


