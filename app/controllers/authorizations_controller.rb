class AuthorizationsController < ApplicationController
  
  def new  	
 	end

 	def instagram
	  response = Instagram.get_access_token(params[:code], redirect_uri: authorize_instagram_url)
	  session[:instagram_authorization] = response.access_token
	  redirect_to user_current_path
 	end

 	def facebook
		# session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/current') ###these two lines are to specify the @auth_url
		# @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")             ###WE SHOULD FIND A BETTER WAY TO DO THIS.
 	end

end

