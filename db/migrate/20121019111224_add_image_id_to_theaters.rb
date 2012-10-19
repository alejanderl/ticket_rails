class AddImageIdToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :image_id, :integer
  end
end
