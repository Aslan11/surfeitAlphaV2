class CreateAccessTokens < ActiveRecord::Migration
  def up
  	create_table :access_tokens do |t|
      t.string :service
      t.string :access_token
      t.integer :user_id

      t.timestamps
    end
  end

  def down
  end
end
