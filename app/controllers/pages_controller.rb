class PagesController < ApplicationController

  before_filter :check_for_authorizations

  def current 
  	@facebook_feed = []
  	@instagram_feed = []
    @twitter_feed = []
    @tweeting = []

    if current_user.access_token('facebook').present?
        
      @facebook_status = Koala::Facebook::API.new(current_user.access_token('facebook')) 
      # @facebook_status.put_connections("me", "feed", :message => "Surfeit now supports native Facebook status updates!!!")
    	
      @facebook_feed = Koala::Facebook::API.new(current_user.access_token('facebook')).get_object("/me/home")
       # @like_status = @facebook_feed.put_connections("me", "your_app_namespace:like", :object => user_current_path)
    end

    if current_user.access_token('instagram').present?
    	@instagram_feed = Instagram.client(:access_token => current_user.access_token('instagram')).user_media_feed.data
    end

    if current_user.access_token('twitter').present? && current_user.access_token_secret('twitter').present?
        @twitter_feed = Twitter::Client.new(
          :consumer_key => 'xogiGTZHrPs8AM86wCtHBQ',
          :consumer_secret => 'iIiM39fNGsC3vbGYJ9tqHT524m9OJWveeQFs5rd0',
          :oauth_token => current_user.access_token('twitter'),
          :oauth_token_secret => current_user.access_token_secret('twitter')
        ).home_timeline

        @tweeting = Twitter::Client.new(
          :consumer_key => 'xogiGTZHrPs8AM86wCtHBQ',
          :consumer_secret => 'iIiM39fNGsC3vbGYJ9tqHT524m9OJWveeQFs5rd0',
          :oauth_token => current_user.access_token('twitter'),
          :oauth_token_secret => current_user.access_token_secret('twitter')
        )

    end
  end

private

  def check_for_authorizations
     redirect_to authorizations_path unless has_authorizations?
  end

end



