class AddImageToCinemas < ActiveRecord::Migration
  def change
    add_column :cinemas, :image, :string
  end
end
