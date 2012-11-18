class PagesController < ApplicationController
  
  def index
  	if session[:user_id]   # someone is already logged in
     	redirect_to user_current_path
  	 end
  end

  def current

  	 if !session[:user_id]   # no one is logged in
     	redirect_to index_path, :notice => "You must sign in first"
  	 end

  	 

  end

end
