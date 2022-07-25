class Users < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :nickname
      t.string :phone
      t.string :password
      t.string :telegram
      t.string :last_name
    end

    create_table :rules do |t|
      t.integer :user_id
      t.boolean :worker, default: true
      t.boolean :manager, default: false
      t.boolean :create_user
      t.boolean :edit_user
      t.boolean :edit_all_work_list
      t.boolean :edit_work_list
      t.boolean :edit_all_eggs_collection
      t.boolean :edit_eggs_collection
    end

    create_table :work_shift_schedules do |t|
      t.string :user_id
      t.string :period_date
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
    end

    create_table :work_lists do |t|
      t.integer :user_id
      t.integer :years
      t.integer :month
      t.integer :day
      t.integer :week
      t.string  :work_start
      t.string  :work_stop
      t.string  :break_start
      t.string  :break_stop
      t.string  :hours
      t.string  :work_list
    end

    create_table :eggs_collections do |t|
      t.integer :user_id
      t.string  :years
      t.string  :month
      t.integer :day
      t.string  :lsl_prima
      t.string  :craggs
      t.string  :big_plus_small
      t.string  :floor_eggs
      t.string  :egg_weight
      t.string  :deads
      t.string  :water_ml_day
      t.string  :feed_g_day
      t.string  :hen_weight
      t.boolean :check_nests
      t.string :mark_1
      t.string :mark_1_with_years
      t.string :info_started
    end
  end

  def down
    drop_table :users
    drop_table :work_lists
    drop_table :work_shift_schedules
    drop_table :rules
    drop_table :eggs_collections
  end
end
