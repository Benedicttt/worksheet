class EggsCollect < ActiveRecord::Migration[7.0]
  def up
    create_table :egg_collects do |t|
      t.string :day
      t.string :month
      t.string :year
      t.integer :prima
      t.integer :craggs
      t.string  :big_small
      t.integer :flooreggs
      t.integer :egg_width
      t.integer :deads_chick
      t.integer :deads_hen
      t.integer :water_ml_day
      t.integer :feed_g_day
      t.integer :hen_width
    end
  end

  def down
    drop_table :egg_collects
  end
end
