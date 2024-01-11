class AddLecturerSocialMedia < ActiveRecord::Migration[7.0]
  def change
    add_column :lecturers, :facebook, :string
    add_column :lecturers, :email, :string, null: false, index: true
    add_column :lecturers, :linkedIn, :string
    add_column :lecturers, :twitter, :string
    add_column :lecturers, :wellfound, :string
    add_column :lecturers, :instagram, :string
    add_column :lecturers, :medium, :string
    add_column :lecturers, :nationality, :string, null: false, index: true
    remove_column :lecturers, :lga_of_origin
  end
end
