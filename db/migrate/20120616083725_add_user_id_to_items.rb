class AddUserIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
  end
  
  def self.down
    remove_column :items, :user_id
  end
end
