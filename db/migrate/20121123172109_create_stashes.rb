class CreateStashes < ActiveRecord::Migration
  def change
    create_table :stashes do |t|
      t.integer :user_id
      t.string :stashed_item

      t.timestamps
    end
  end
end
