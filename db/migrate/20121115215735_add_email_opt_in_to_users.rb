class AddEmailOptInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_opt_in, :boolean
  end
end
