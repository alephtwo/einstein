class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|

      t.string :encrypted_last_name, null: false

      t.timestamps
    end
  end
end
