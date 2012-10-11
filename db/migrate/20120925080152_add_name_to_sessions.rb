class AddNameToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :name, :string
  end
end
