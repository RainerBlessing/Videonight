class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :login, :null => false
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end

    add_index :users, :login,                :unique => true
  end

end
