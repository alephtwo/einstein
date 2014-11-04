class AddIsDeleted < ActiveRecord::Migration
  def change
    add_column :clients, :is_deleted, :boolean, :default => false
    add_column :behaviors, :is_deleted, :boolean, :default => false
    add_column :behavior_reports, :is_deleted, :boolean, :default => false
  end
end
