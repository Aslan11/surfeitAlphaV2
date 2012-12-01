class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:current]
  before_filter :auth_instagram, :only => [:current]

  def index
    redirect_to instagram_access_url if session[:user_id]
  end

  def current 

    if params[:code]
    session[:access_token] = session[:oauth].get_access_token(params[:code])
    end   


    @api = Koala::Facebook::API.new(session[:access_token])
    @graph_data = @api.get_object("/me/home")
  end

  def auth_instagram
    redirect_to :controller => 'sessions', :action => 'connect' unless session[:access_token] 
    client = Instagram.client(:access_token => session[:access_token])
    @mediafeed = client.user_media_feed
  end

  def facebook  
  end
    
    
  private

  def authenticate_user!
    redirect_to index_path, notice: "You must sign in first" unless session[:user_id]
  end

end
