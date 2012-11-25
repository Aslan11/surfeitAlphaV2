require 'instagram'

class SessionsController < ApplicationController


	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)	
	end

	def callback
    	response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    	session[:access_token] = response.access_token
    	redirect_to :controller => 'pages', :action => 'current'
  	end


	def login
		if 
      		session[:user_id] != nil
      		redirect_to channels_url
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
			session[:user_id] = user.id
			session[:email] = user.email

      redirect_to user_current_url
      
  	end


  		def failure
  			
  		end



	def create_surfeit

	 user = User.find_by_email(params[:email])
  #  (user != nil && user.authenticate(params[:password]) ? (session[:user_id] = user.id redirect_to(instagram_access_url)) : (redirect_to(index_path) ; :notice => "Email & Password do not match")
    
   		 if user != nil && user.authenticate(params[:password])
   		   session[:user_id] = user.id
   		   redirect_to channels_url
   		 else
   		   redirect_to index_path, :notice => "Email & Password do not match"
   		 end
	end



	def destroy
	
		session[:user_id] = nil
    session[:access_token] = nil
    	redirect_to index_path

	end


end

