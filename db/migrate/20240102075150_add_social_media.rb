class AddSocialMedia < ActiveRecord::Migration[7.0]
  def change
    add_column :deans, :facebook, :string
    add_column :deans, :email, :string, null: false, index: true
    add_column :deans, :linkedIn, :string
    add_column :deans, :twitter, :string
    add_column :deans, :wellfound, :string
    add_column :deans, :instagram, :string
    add_column :deans, :medium, :string
    add_column :deans, :nationality, :string, null: false, index: true
    remove_column :deans, :lga_of_origin
  end
end
