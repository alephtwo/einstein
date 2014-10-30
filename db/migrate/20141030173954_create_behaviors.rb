class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|

      t.belongs_to :client
      t.string :encrypted_description

      t.timestamps
    end
  end
end
