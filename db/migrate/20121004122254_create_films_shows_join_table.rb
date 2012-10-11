class CreateFilmsShowsJoinTable < ActiveRecord::Migration
  def change
      create_table :films_shows, :id => false do |t|
        t.integer :film_id
        t.integer :show_id
      end
  end
end
