class CounterChiks < ActiveRecord::Migration[7.0]
  def up
    create_table :count_chicks do |t|
      t.string  :house
      t.integer :year_start
      t.integer :year_end
      t.integer :chicks_start
      t.integer :kukko_start
      t.integer :month_start
    end

    add_column :egg_collects, :house, :string
  end

  def down
    drop_table :count_chicks
    remove_column :egg_collects, :house
  end
end
