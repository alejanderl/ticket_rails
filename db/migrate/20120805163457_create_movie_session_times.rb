class CreateMovieSessionTimes < ActiveRecord::Migration
  def change
    create_table :movie_session_times do |t|

      t.timestamps
    end
  end
end
