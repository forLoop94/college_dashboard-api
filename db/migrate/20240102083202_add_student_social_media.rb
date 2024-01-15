class AddStudentSocialMedia < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :facebook, :string
    add_column :students, :email, :string, null: false, index: true
    add_column :students, :linkedIn, :string
    add_column :students, :twitter, :string
    add_column :students, :wellfound, :string
    add_column :students, :instagram, :string
    add_column :students, :medium, :string
    add_column :students, :nationality, :string, null: false, index: true
    remove_column :students, :lga_of_origin
  end
end
