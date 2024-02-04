class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.integer :code, null: false
      t.integer :level, null: false
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
    add_index :courses, :title, unique: true
  end
end
