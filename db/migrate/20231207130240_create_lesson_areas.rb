class CreateLessonAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_areas do |t|
      t.references :student, null: false, index: true, foreign_key: true
      t.references :course, null: false, index: true, foreign_key: true
      t.references :lecturer, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
