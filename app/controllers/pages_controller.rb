class PagesController < ApplicationController
  
  def index
  end

  def current
  	 if !session[:user_id]   # no one is logged in
     	redirect_to index_path, :notice => "You must sign in first"
  	 end
  end

end
