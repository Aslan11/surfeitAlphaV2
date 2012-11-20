class PagesController < ApplicationController


  def instagram

  redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 

  client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    @recent_media_items = client.user_recent_media
    
  end
  
  def index
  	if session[:user_id]   # someone is already logged in
     	# redirect_to user_current_path
      puts "Logged in as #{session[:email]}"
  	 end
  end

  def current
  	 if !session[:user_id]   # no one is logged in
     	redirect_to index_path, :notice => "You must sign in first"
  	 end	 

  redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 

  client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    @recent_media_items = client.user_media_feed
    @mediafeed = client.user_media_feed
    
  end

end
