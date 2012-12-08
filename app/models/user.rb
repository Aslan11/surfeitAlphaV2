class User < ActiveRecord::Base

	include Gravtastic
  gravtastic

  attr_accessible :email, :name, :password, :password_confirmation, :username, :email_opt_in

  has_many :access_tokens

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email, :username

  before_validation do
  		self.username = self.username.downcase
  		self.email = self.email.downcase
	end

  def self.from_omniauth(auth)
	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def access_token(service)
		token = AccessToken.find_by_user_id_and_service(id, service)
		token ? token.access_token : false
	end

	def access_token_secret(service)
		token = AccessToken.find_by_user_id_and_service(id, service)
		token ? token.access_token_secret : false
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
