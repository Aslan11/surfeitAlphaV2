require 'instagram'

class SessionsController < ApplicationController


	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)	
	end

	def callback
    	response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    	session[:access_token] = response.access_token
    	redirect_to :controller => 'channels', :action => 'index'

  	end

    def callback_fb

      if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end   

     # auth established, now do a graph call:
      
    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    rescue Exception=>ex
      puts ex.message
    end
    
  
    respond_to do |format|
     format.html {   }       
    end
    
      
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
	
		# session[:user_id] = nil
    reset_session
    redirect_to index_path

	end

end
