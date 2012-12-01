class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :fb_access_token
      t.string :twitter_access_token
      t.string :instagram_access_token

      t.timestamps
    end
  end
end
