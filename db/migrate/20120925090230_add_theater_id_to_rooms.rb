class AddTheaterIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :theater_id, :integer
  end
end
