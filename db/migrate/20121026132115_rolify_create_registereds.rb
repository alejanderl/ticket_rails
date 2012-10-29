class RolifyCreateRegistereds < ActiveRecord::Migration
  def change
    create_table(:registereds) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_registereds, :id => false) do |t|
      t.references :user
      t.references :registered
    end

    add_index(:registereds, :name)
    add_index(:registereds, [ :name, :resource_type, :resource_id ])
    add_index(:users_registereds, [ :user_id, :registered_id ])
  end
end
