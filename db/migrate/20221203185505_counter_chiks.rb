class CounterChiks < ActiveRecord::Migration[7.0]
  def up
    create_table :count_chicks do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.string  :house
      t.integer :chicks_start
      t.integer :kukko_start
    end

    add_column :egg_collects, :house, :string
    add_column :egg_collects, :period, :integer
    add_column :egg_collects, :created_at, :datetime
  end

  def down
    drop_table :count_chicks
    remove_column :egg_collects, :house
    remove_column :egg_collects, :period
    remove_column :egg_collects, :created_at
  end
end
