class UsersController < ApplicationController


  before_filter :ensure_correct_user_id, only: [:show, :edit, :index]

  def ensure_correct_user_id
    if session[:user_id] != params[:id].to_i
      flash[:message] = "You are not authorized to see/edit/delete any other User's user information."
      redirect_to user_url(session[:user_id])
      return
    end
  end


  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    if session[:user_id] != @user.id
      redirect_to user_path(session[:user_id]), notice: "Not authorized"
    else 
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  def new
    @user = User.new
      
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])
    (@user.save) ? (session[:user_id] = @user.id ; redirect_to(authorize_instagram_path)) : (redirect_to(new_user_url) ;   flash[:notice] = "User exists!!!")

  end


  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) ? (redirect_to @user, notice: 'User was successfully updated.') :  (render action: "edit") 
  end

 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  
  end
end
