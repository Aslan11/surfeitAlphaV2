class AccessToken < ActiveRecord::Base

	attr_accessible :user_id, :service, :access_token

	belongs_to :user

end