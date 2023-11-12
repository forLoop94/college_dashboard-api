class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :photo, null: false
      t.bigint :phone_number, null: false
      t.integer :level, null: false
      t.string :gender, null: false
      t.references :department, null: false, foreign_key: true
      t.integer :age
      t.text :bio
      t.string :lga_of_origin

      t.timestamps
    end
  end
end
