class AddAuthToClient < ActiveRecord::Migration
  def change
    add_column :clients, :password_digest, :string, null: false
  end
end
