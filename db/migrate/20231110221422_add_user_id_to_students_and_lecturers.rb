class AddUserIdToStudentsAndLecturers < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :user, foreign_key: true
    add_reference :lecturers, :user, foreign_key: true
  end
end
