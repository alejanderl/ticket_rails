class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :file
      t.string :alt_text

      t.timestamps
    end
  end
end
