class AddImageToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :image, :string
  end
end
