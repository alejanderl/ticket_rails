class AddGroupcodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :group_code, :string
  end
end
