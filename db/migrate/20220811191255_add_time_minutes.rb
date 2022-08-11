class AddTimeMinutes < ActiveRecord::Migration[7.0]
  def up
      add_column :work_lists, :work_start_minutes, :float
      add_column :work_lists, :work_stop_minutes, :float
      add_column :work_lists, :break_start_minutes, :float
      add_column :work_lists, :break_stop_minutes, :float
      add_column :work_lists, :hours_minutes, :float
  end

  def down
    remove_column :work_lists, :work_start_minutes
    remove_column :work_lists, :work_stop_minutes
    remove_column :work_lists, :break_start_minutes
    remove_column :work_lists, :break_stop_minutes
    remove_column :work_lists, :hours_minutes
  end
end
