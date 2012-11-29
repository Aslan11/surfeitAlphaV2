class UsersController < ApplicationController

  # before_filter :require_user, :except => [:new, :create]
  
  # def require_user
  #   # if !session[:user_id] 
  #   #   redirect_to index_path, notice: "You must sign in first."
  #   # elsif session[:user_id] != params[:id]
  #   #   redirect_to user_path(session[:user_id]), notice: "Not authorized"
  #   # end
  # end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
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

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
      
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    (@user.save) ? (session[:user_id] = @user.id ; redirect_to(instagram_access_url)) : (redirect_to(new_user_url) ;   flash[:notice] = "User exists!!!")

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
