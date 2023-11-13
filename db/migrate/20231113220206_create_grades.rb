class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.integer :value, null: false
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
