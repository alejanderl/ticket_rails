class RemoveImageFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :image
  end

  def down
    add_column :events, :image, :string
  end
end
