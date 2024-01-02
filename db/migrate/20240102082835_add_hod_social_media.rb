class AddHodSocialMedia < ActiveRecord::Migration[7.0]
  def change
    add_column :hods, :facebook, :string
    add_column :hods, :email, :string, null: false, index: true
    add_column :hods, :linkedIn, :string
    add_column :hods, :twitter, :string
    add_column :hods, :wellfound, :string
    add_column :hods, :instagram, :string
    add_column :hods, :medium, :string
    add_column :hods, :nationality, :string, null: false, index: true
    remove_column :hods, :lga_of_origin
  end
end
