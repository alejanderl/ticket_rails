class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :genre

      t.timestamps
    end
  end
end
