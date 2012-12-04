Surfeitalpha::Application.routes.draw do
  root to: "pages#current"


  get '/current' => 'pages#current', :as => :user_current

  match 'session/instagram', :to => 'authorizations#instagram',  :as => :authorize_instagram
  match 'session/facebook', :to => 'authorizations#facebook',  :as => :authorize_facebook
  match 'auth/twitter/callback', :to => 'authorizations#twitter', :as => :authorize_twitter # auth/twitter/callback needs to change to session/twitter PLEASE!

  resource  :session  
  resources  :authorizations

  resources :users 
  resources :stashes

  get '/sessions/destroy' => 'sessions#destroy', :as => :logout
  
end



# get '/login' => 'sessions#login', :as => :login
# post '/sessions/create' => 'sessions#create_surfeit'
# match 'auth/twitter/callback', :to => 'sessions#create_twitter', :as => :twitter_auth
# match 'auth/facebook/callback', :to => 'sessions#create_facebook', :as => :facebook_auth
# match 'auth/failure', :to => 'sessions#failure'
# get '/sessions/logout' => 'sessions#destroy', :as => :logout