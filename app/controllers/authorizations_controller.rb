class AuthorizationsController < ApplicationController
  
  def new  
 	end

 	def instagram
	  response = Instagram.get_access_token(params[:code], redirect_uri: authorize_instagram_url)
	  cookies[:instagram_authorization] = { :value => response.access_token, :expires => 1.hour.from_now }  
	  redirect_to user_current_path
 	end

 	def facebook
		response = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, authorize_facebook_url)
		cookies[:facebook_authorization] = { :value => response.get_access_token(params[:code]), :expires => 1.hour.from_now }
		redirect_to user_current_path
  end

end

