class AddUserdinaddresses < ActiveRecord::Migration
  def up
     add_column :addresses, :user_id, :integer
  end

  def down
    remove_column :addresses, :user_id , :integer
  end
  
end
