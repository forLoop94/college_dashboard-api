class AddColumnToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :credit_load, :integer, null: false, index: true
  end
end
