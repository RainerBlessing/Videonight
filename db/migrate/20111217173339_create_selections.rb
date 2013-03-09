class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :event
      t.references :movie

      t.timestamps
    end
    add_index :selections, :event_id
    add_index :selections, :movie_id
  end
end
