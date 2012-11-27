class Stash < ActiveRecord::Base
  attr_accessible :stashed_item, :user_id

  belongs_to :user

  
end
