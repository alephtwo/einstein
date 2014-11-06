class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.belongs_to :user
      t.integer :reports_deleted
      t.integer :behaviors_deleted
      t.integer :clients_deleted
      t.integer :total_deleted
      t.timestamps
    end
  end
end
