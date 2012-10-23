class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :code
      t.string :shortname

      t.timestamps
    end
  end
end
