class RolifyCreateManagers < ActiveRecord::Migration
  def change
    create_table(:managers) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_managers, :id => false) do |t|
      t.references :user
      t.references :manager
    end

    add_index(:managers, :name)
    add_index(:managers, [ :name, :resource_type, :resource_id ])
    add_index(:users_managers, [ :user_id, :manager_id ])
  end
end
