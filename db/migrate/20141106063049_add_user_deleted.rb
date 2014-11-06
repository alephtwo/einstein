class AddUserDeleted < ActiveRecord::Migration
  def change
    add_column :maintenances, :deleted_user, :string
  end
end
