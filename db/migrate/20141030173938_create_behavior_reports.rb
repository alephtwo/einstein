class CreateBehaviorReports < ActiveRecord::Migration
  def change
    create_table :behavior_reports do |t|

      t.belongs_to :behavior
      t.integer :occurrences

      t.timestamps
    end
  end
end
