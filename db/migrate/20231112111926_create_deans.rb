class CreateDeans < ActiveRecord::Migration[7.0]
  def change
    create_table :deans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, null: false
      t.integer :years_of_admin_exp, null: false
      t.string :number_of_publications, null: false
      t.string :highest_academic_qualification, null: false
      t.string :photo, null: false
      t.string :rank, null: false
      t.text :bio, null: false
      t.references :school, null: false, foreign_key: true
      t.integer :age, null: false
      t.bigint :phone_number, null: false
      t.string :lga_of_origin, null: false

      t.timestamps
    end
  end
end
