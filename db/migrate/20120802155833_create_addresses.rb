class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.integer :postal_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
