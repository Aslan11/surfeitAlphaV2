class AuthorizationsController < ApplicationController
  
  def index	  
 	end

 	def destroy
 		AccessToken.destroy(user_id: params[:user_id], service: params[:service])
 		redirect_to authorizations_path
 	end

 	def instagram
	  response = Instagram.get_access_token(params[:code], redirect_uri: authorize_instagram_url)
	  
	  AccessToken.create(
	  	access_token: response.access_token, 
	  	user_id: current_user.id, 
	  	service: 'instagram'
	  )
	  
	  redirect_to authorizations_path
 	end

 	def facebook
		response = Koala::Facebook::OAuth.new('333831113381266', '43e26a8d150ba3db9a0308031fdbfd86', authorize_facebook_url)
		
		 AccessToken.create(
	  	access_token: response.get_access_token(params[:code]), 
	  	user_id: current_user.id, 
	  	service: 'facebook'
	  )

	  redirect_to authorizations_path, :notice => 'User Was successfully authorized!!!'
  end

  def twitter
  
  	response = env['omniauth.auth']
  	
  	
	  AccessToken.create(
	  	access_token: response.credentials.token,
	  	access_token_secret: response.credentials.secret, 
	  	user_id: current_user.id, 
	  	service: 'twitter'
	  )
	  
	  redirect_to authorizations_path
  end



end



