class ApplicationController < ActionController::Base

	protect_from_forgery
	helper_method :current_user

  # before_filter :authenticate!

private

  # user authentication

  def authenticate!
    unless current_user
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  # social apps authorizations

  def instagram_authorization
    current_user.access_token('instagram')
  end

  def facebook_authorization
    current_user.access_token('facebook')
  end

  def twitter_authorization
    current_user.access_token('twitter')
  end

  def has_authorizations?
    instagram_authorization.present? || facebook_authorization.present? || twitter_authorization.present?
  end
  helper_method :instagram_authorization, :facebook_authorization, :has_any_authorization?


end