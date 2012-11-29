class ChannelsController < ApplicationController
  
  def index

  	@user = User.find(session[:user_id])
  	session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/current')
	@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")
	puts session.to_s + "<<< session"

  end


end
