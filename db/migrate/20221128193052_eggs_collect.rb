class EggsCollect < ActiveRecord::Migration[7.0]
  def up
    create_table :egg_collects do |t|
      t.string :day
      t.string :month
      t.string :year
      t.float :prima, default: 0
      t.float :craggs, default: 0
      t.string :big_small, default: "0+0"
      t.string :comments, default: ""
      t.float :flooreggs, default: 0
      t.float :egg_width, default: 0
      t.float :deads_chick, default: 0
      t.float :deads_hen, default: 0
      t.float :water_ml_day, default: 0
      t.float :feed_g_day, default: 0
      t.float :hen_width, default: 0
    end
  end

  def down
    drop_table :egg_collects
  end
end
