class AccessToken < ActiveRecord::Base

	attr_accessible :user_id, :service, :access_token, :access_token_secret

	belongs_to :user

end