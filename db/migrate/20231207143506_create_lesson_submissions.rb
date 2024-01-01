class CreateLessonSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_submissions do |t|
      t.text :links, null: false
      t.references :lesson_area, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
