class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :repetition_rule
      t.integer :stall_total

      t.timestamps
    end
  end
end
