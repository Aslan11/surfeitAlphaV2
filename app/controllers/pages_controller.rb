class PagesController < ApplicationController

  before_filter :check_for_authorizations

  def current 
  	@facebook_feed = []
  	@instagram_feed = []

    if current_user.access_token('facebook').present?
    	 @facebook_feed = Koala::Facebook::API.new(current_user.access_token('facebook')).get_object("/me/home")
    end

    if current_user.access_token('instagram').present?
    	@instagram_feed = Instagram.client(:access_token => current_user.access_token('instagram')).user_media_feed.data
    end
  end

private

  def check_for_authorizations
     redirect_to new_authorizations_path unless has_authorizations?
  end

end



