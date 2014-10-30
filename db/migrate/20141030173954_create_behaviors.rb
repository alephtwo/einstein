class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|

      t.belongs_to :client
      t.string :encrypted_description, null: false

      t.timestamps
    end
  end
end
