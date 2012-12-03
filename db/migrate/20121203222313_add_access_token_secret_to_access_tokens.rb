class AddAccessTokenSecretToAccessTokens < ActiveRecord::Migration
  def change
  	add_column :access_tokens, :access_token_secret, :string
  end
end
