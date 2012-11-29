class PagesController < ApplicationController

  def instagram
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
    client = Instagram.client(:access_token => session[:access_token])
    @instagram_user = client.user
    @recent_media_items = client.user_recent_media
  end
  
  def index
    redirect_to user_current_path if session[:user_id]
  end

  def current
    if !session[:user_id]   # no one is logged in
      redirect_to index_path, :notice => "You must sign in first"
    end  
    
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
    client = Instagram.client(:access_token => session[:access_token])
    @instagram_user = client.user
    @recent_media_items = client.user_media_feed
    @mediafeed = client.user_media_feed
    @user = User.find(session[:user_id])  

    if params[:code]
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end   

    @api = Koala::Facebook::API.new(session[:access_token])
    @graph_data = @api.get_object("/me/home")
  end
    
end
