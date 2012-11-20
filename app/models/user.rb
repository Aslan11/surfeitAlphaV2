class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :username, :email_opt_in

  has_many :channels

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_many :authorizations


def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
  unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
end


  def self.from_omniauth(auth)
	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	
end

	def self.create_from_omniauth(auth)

		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			# user.username = auth["info"]["username"]
			user.password = auth["uid"]
			user.email = auth["info"]["email"]			
		end
		
	end


end
