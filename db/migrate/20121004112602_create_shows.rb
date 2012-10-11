class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.text :description
      t.integer :content_related

      t.timestamps
    end
  end
end
