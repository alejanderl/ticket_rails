class RemoveImageFromTheaters < ActiveRecord::Migration
  def up
    remove_column :theaters, :image
  end

  def down
    add_column :theaters, :image, :integer
  end
end
