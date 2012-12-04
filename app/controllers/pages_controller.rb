class PagesController < ApplicationController

  before_filter :check_for_authorizations

  def current 
  	@facebook_feed = []
  	@instagram_feed = []
    @twitter_feed = []

    if current_user.access_token('facebook').present?
    	 @facebook_feed = Koala::Facebook::API.new(current_user.access_token('facebook')).get_object("/me/home")
    end

    if current_user.access_token('instagram').present?
    	@instagram_feed = Instagram.client(:access_token => current_user.access_token('instagram')).user_media_feed.data
    end

    if current_user.access_token('twitter').present? && current_user.access_token_secret('twitter').present?
        @twitter_feed = Twitter::Client.new(
          :consumer_key => ENV['TWITTER_KEY'],
          :consumer_secret => ENV['TWITTER_KEY_SECRET'],
          :oauth_token => current_user.access_token('twitter'),
          :oauth_token_secret => current_user.access_token_secret('twitter')
        ).home_timeline
    end
  end

private

  def check_for_authorizations
     redirect_to authorizations_path unless has_authorizations?
  end

end



