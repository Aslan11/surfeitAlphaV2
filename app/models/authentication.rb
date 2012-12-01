class Authentication < ActiveRecord::Base
  attr_accessible :fb_access_token, :instagram_access_token, :twitter_access_token

  belongs_to :user

  def index
  	@authentications = current_user.authentications if current_user
	end

end
