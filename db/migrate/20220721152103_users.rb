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
      t.boolean :is_available, default: false
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
      t.integer :user_id
      t.string  :comment
      t.integer :period_id

      t.string  :monday
      t.float   :monday_hours, default: 0.0

      t.string  :tuesday
      t.float   :tuesday_hours, default: 0.0

      t.string  :wednesday
      t.float   :wednesday_hours, default: 0.0

      t.string  :thursday
      t.float   :thursday_hours, default: 0.0

      t.string  :friday
      t.float   :friday_hours, default: 0.0

      t.string  :saturday
      t.float   :saturday_hours, default: 0.0

      t.string  :sunday
      t.float   :sunday_hours, default: 0.0
    end

    create_table :work_shift_schedule_days do |t|
      t.integer :work_shift_schedule_id
      t.integer :monday_number_day
      t.integer :tuesday_number_day
      t.integer :wednesday_number_day
      t.integer :thursday_number_day
      t.integer :friday_number_day
      t.integer :saturday_number_day
      t.integer :sunday_number_day
    end


    create_table :periods do |t|
      t.integer :to
      t.integer :from
      t.integer :month
      t.integer :year
      t.integer :week_number
    end

    create_table :work_lists do |t|
      t.integer :user_id
      t.integer :years
      t.integer :month
      t.integer :day
      t.string  :work_start
      t.string  :work_stop
      t.string  :break_start
      t.string  :break_stop
      t.string  :hours
      t.string  :comment
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
    drop_table :work_shift_schedule_days
    drop_table :periods
    drop_table :rules
    drop_table :eggs_collections
  end
end
