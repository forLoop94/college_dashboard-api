class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.text :message, null: false
      t.references :lesson_area, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
