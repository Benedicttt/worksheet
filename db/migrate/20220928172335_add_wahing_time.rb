class AddWahingTime < ActiveRecord::Migration[7.0]
  def up
    add_column :work_lists, :washing_time_minutes, :float
    add_column :work_lists, :washing_time, :string
  end

  def down
    remove_column :work_lists, :washing_time_minutes
    remove_column :work_lists, :washing_time
  end
end
