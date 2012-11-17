class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :username, :email_opt_in

  has_many :channels
  has_one :account

  has_secure_password

  validates_presence_of :name, :email, :username
  validates_uniqueness_of :email, :username

  def self.from_omniauth(auth)
	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	
end

	def self.create_from_omniauth(auth)

		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
		
	end


end
