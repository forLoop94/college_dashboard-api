class ChangeNullConstarintInStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :user_id, :bigint, null: false
    change_column :lecturers, :user_id, :bigint, null: false
  end
end
