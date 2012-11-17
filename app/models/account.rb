class Account < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :users

  

end
