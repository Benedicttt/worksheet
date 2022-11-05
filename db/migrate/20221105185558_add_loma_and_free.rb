class AddLomaAndFree < ActiveRecord::Migration[7.0]
  def up
    add_column :work_lists, :free_day, :boolean, default: false
    add_column :work_lists, :vacation, :boolean, default: false
  end

  def down
    remove_column :work_lists, :free_day
    remove_column :work_lists, :vacation
  end
end
