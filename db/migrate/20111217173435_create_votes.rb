class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :selection
      t.references :user
      t.integer :value

      t.timestamps
    end
    add_index :votes, :selection_id
    add_index :votes, :user_id
  end
end
