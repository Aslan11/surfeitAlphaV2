class SessionsController < ApplicationController


	def login
		if 
      		session[:user_id] != nil
      		redirect_to users_path
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



	def create_surfeit

	 user = User.find_by_email(params[:email])
    
   		 if user != nil && user.authenticate(params[:password])
   		   session[:user_id] = user.id
   		   redirect_to users_path
   		 else
   		   redirect_to index_path, :notice => "Email & Password do not match"
   		 end
	end



	def destroy
	
		session[:user_id] = nil
    	redirect_to index_path

	end


end

