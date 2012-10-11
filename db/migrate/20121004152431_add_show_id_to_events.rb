class AddShowIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :show_id, :integer
  end
end
