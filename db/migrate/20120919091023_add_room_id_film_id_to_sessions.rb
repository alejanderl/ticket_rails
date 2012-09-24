class AddRoomIdFilmIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :room_id, :integer
    add_column :sessions, :film_id, :integer
  end
end
