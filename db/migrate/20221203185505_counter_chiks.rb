class CounterChiks < ActiveRecord::Migration[7.0]
  def up
    create_table :count_chicks do |t|
      t.integer :month
      t.integer :year
      t.integer :chicks_count
      t.integer :kukko_count
    end

    add_column :egg_collects, :house, :string
  end

  def down
    drop_table :count_chicks
    remove_column :egg_collects, :house
  end
end
