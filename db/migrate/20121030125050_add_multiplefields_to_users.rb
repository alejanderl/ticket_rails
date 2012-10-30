class AddMultiplefieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :nick_name, :string
    add_column :users, :image_id, :integer
  end
end
