class AddUsernameColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    add_index :users, :username
  end
end
