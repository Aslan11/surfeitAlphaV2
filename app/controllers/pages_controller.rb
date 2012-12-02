class PagesController < ApplicationController

  before_filter :check_for_authorizations

  def current 
  	@facebook_feed = []
  	@instagram_feed = []

  	if facebook_authorization.present?
    	 @facebook_feed = Koala::Facebook::API.new(facebook_authorization).get_object("/me/home")
    end

    if instagram_authorization.present?
    	@instagram_feed = Instagram.client(:access_token => instagram_authorization).user_media_feed.data
    end
  end

private

  def check_for_authorizations
     redirect_to new_authorizations_path unless has_authorizations?
  end

end
