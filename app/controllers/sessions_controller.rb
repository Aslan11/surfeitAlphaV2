require 'instagram'

class SessionsController < ApplicationController

  skip_before_filter :authenticate!, except: [:destroy]

	def new
	end

	def create
    user = User.find_by_email(params[:email])
    
   	if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_current_path
    else
      redirect_to new_session_path, :notice => "Username or Password Incorrect"
    end
	end

	def destroy
		session[:user_id] = nil
    redirect_to new_session_path
	end

end