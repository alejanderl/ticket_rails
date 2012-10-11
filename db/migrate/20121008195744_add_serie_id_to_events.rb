class AddSerieIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :serie_id, :integer
  end
end
