class AddIsActive < ActiveRecord::Migration
  def change
    add_column :behavior_reports, :removed, :boolean, :default => false, :null => false
    add_column :behaviors, :removed, :boolean, :default => false, :null => false
    add_column :clients, :removed, :boolean, :default => false, :null => false
  end
end
