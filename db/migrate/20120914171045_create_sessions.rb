class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :date
      t.integer :stall_available
      t.integer :stall_reserve
      t.boolean :exception

      t.timestamps
    end
  end
end
