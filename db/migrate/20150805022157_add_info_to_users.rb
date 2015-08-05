class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :email, :string
    add_column :users, :occupation_type, :string
    add_column :users, :age, :string
    add_column :users, :dc_voter, :string
    add_column :users, :zip, :string
    add_column :users, :ward, :integer
    add_column :users, :upload_pic, :string
    add_column :users, :join_date, :string
  end
end
