class AddEncryptedUserDetails < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_first_name, :string
    add_column :users, :encrypted_middle_name, :string
    add_column :users, :encrypted_last_name, :string
  end
end
