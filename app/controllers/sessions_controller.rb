require 'instagram'

class SessionsController < ApplicationController


	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)	
	end

	def callback
   session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/current') ###these two lines are to specify the @auth_url
   @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")             ###WE SHOULD FIND A BETTER WAY TO DO THIS.


   response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
   session[:access_token] = response.access_token
   redirect_to @auth_url
  end


	def login
		if 
      session[:user_id] != nil 
      redirect_to channels_path
    else
      flash[:notice] = "Email or Password do not match. Try again."
      redirect_to index_path
    end	
	end

	
	def create_twitter
		user = User.from_omniauth (env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to user_path, notice: "Signed In!"
	end


	def auth_hash
    request.env['omniauth.auth']
  end


  def create_facebook
  	user = User.from_omniauth (env["omniauth.auth"])
    token = env['omniauth']['credentials']['token']
		session[:user_id] = user.id
		session[:email] = user.email

    redirect_to user_current_url
  end
      

  def failure
  
  end


	def create_surfeit
    user = User.find_by_email(params[:email])
    
   	if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to channels_url
    else
      redirect_to index_path, :notice => "Email & Password do not match"
    end
	end



	def destroy
		session[:user_id] = nil
    # reset_session
    redirect_to index_path
	end

end
