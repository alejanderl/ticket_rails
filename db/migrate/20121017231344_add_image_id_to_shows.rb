class AddImageIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :image_id, :integer
  end
end
