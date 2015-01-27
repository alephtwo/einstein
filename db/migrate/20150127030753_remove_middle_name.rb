class RemoveMiddleName < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_middle_name
  end
end
