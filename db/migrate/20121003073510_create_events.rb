class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :date
      t.integer :stall_available
      t.integer :stall_reserve
      t.integer :stall_total
      t.integer :exception

      t.timestamps
    end
  end
end
