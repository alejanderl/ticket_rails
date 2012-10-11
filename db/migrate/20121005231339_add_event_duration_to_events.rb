class AddEventDurationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_duration, :decimal
  end
end
