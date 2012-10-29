class RolifyCreateAdministrators < ActiveRecord::Migration
  def change
    create_table(:administrators) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_administrators, :id => false) do |t|
      t.references :user
      t.references :administrator
    end

    add_index(:administrators, :name)
    add_index(:administrators, [ :name, :resource_type, :resource_id ])
    add_index(:users_administrators, [ :user_id, :administrator_id ])
  end
end
