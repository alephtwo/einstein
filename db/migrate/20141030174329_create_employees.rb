class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|

      t.string :encrypted_first_name
      t.string :encrypted_middle_name
      t.string :encrypted_last_name

      t.string :encrypted_username, null: false

      t.timestamps
    end
  end
end
