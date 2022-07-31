user = User.new
rules = Rule.new

user.first_name = "admin"
user.last_name = ""
user.email = "admin@admin.com"
user.nickname = "admin"
user.phone = ""
user.telegram = ""
user.password = "Admin1234"
user.save!


//
rules.user_id = user.id
rules.manager = true
rules.worker = false
rules.create_user = true
rules.edit_user = true
rules.edit_all_work_list = true
rules.edit_work_list = true
rules.edit_all_eggs_collection = true
rules.edit_eggs_collection = true
rules.save!

# //
# p = Period.new
# p.to = 25
# p.from = 31
# p.month = 7
# p.year = 2022
# p.save!

# //
# user = User.new
# rules = Rule.new
# wl = WorkShiftSchedule.new
#
# user.first_name = "Serhii"
# user.last_name = "Kiyvskyi"
# user.email = "benedicttt270519873@gmail.com"
# user.nickname = "benedicttt"
# user.phone = "044 984-72-54"
# user.telegram = "@SergeyK2705"
# user.password = "Folken123123"
# user.is_available = true
# user.save!
#
# rules.user_id = user.id
# rules.manager = false
# rules.worker = true
# rules.create_user = false
# rules.edit_user = false
# rules.edit_all_work_list = false
# rules.edit_work_list = true
# rules.edit_all_eggs_collection = false
# rules.edit_eggs_collection = true
# rules.save!
#
# //
# wl.user_id = user.id
# wl.period_id = p.id
# wl.monday = "monday"
# wl.monday_hours = 8.0
# wl.tuesday = "tuesday"
# wl.tuesday_hours = 8.0
# wl.wednesday = "wednesday"
# wl.wednesday_hours = 8.0
# wl.thursday = "thursday"
# wl.thursday_hours = 8.0
# wl.friday = "friday"
# wl.friday_hours = 8.0
# wl.saturday = "saturday"
# wl.saturday_hours = 8.0
# wl.sunday = "sunday"
# wl.sunday_hours = 8.0
# wl.save!
#
# //
#
# user = User.new
# rules = Rule.new
# wl = WorkShiftSchedule.new
#
# user.first_name = "Serhii"
# user.last_name = "Kiyvskyi"
# user.email = "benedicttt270519874@gmail.com"
# user.nickname = "benedicttt"
# user.phone = "044 984-72-54"
# user.telegram = "@SergeyK2705"
# user.password = "Folken123123"
# user.is_available = true
# user.save!
#
# rules.user_id = user.id
# rules.manager = false
# rules.worker = true
# rules.create_user = false
# rules.edit_user = false
# rules.edit_all_work_list = false
# rules.edit_work_list = true
# rules.edit_all_eggs_collection = false
# rules.edit_eggs_collection = true
# rules.save!
#
# //
# wl.user_id = user.id
# wl.period_id = p.id
# wl.monday = "monday"
# wl.monday_hours = 8.0
# wl.tuesday = "tuesday"
# wl.tuesday_hours = 8.0
# wl.wednesday = "wednesday"
# wl.wednesday_hours = 8.0
# wl.thursday = "thursday"
# wl.thursday_hours = 8.0
# wl.friday = "friday"
# wl.friday_hours = 8.0
# wl.saturday = "saturday"
# wl.saturday_hours = 8.0
# wl.sunday = "sunday"
# wl.sunday_hours = 8.0
# wl.save!
#
# //
# //
# user = User.new
# rules = Rule.new
# wl = WorkShiftSchedule.new
#
# p = Period.new
# p.to = 31
# p.from = 5
# p.month = 8
# p.year = 2022
# p.save!
#
# user.first_name = "Serhii1"
# user.last_name = "Kiyvskyi2"
# user.email = "benedicttt270519871@gmail.com"
# user.nickname = "benedicttt"
# user.phone = "044 984-72-54"
# user.telegram = "@SergeyK2705"
# user.password = "Folken123123"
# user.is_available = true
# user.save!
#
# rules.user_id = user.id
# rules.manager = false
# rules.worker = true
# rules.create_user = false
# rules.edit_user = false
# rules.edit_all_work_list = false
# rules.edit_work_list = true
# rules.edit_all_eggs_collection = false
# rules.edit_eggs_collection = true
# rules.save!
#
# //
# wl.user_id = user.id
# wl.period_id = p.id
# wl.monday = "monday"
# wl.monday_hours = 8.0
# wl.tuesday = "tuesday"
# wl.tuesday_hours = 8.0
# wl.wednesday = "wednesday"
# wl.wednesday_hours = 8.0
# wl.thursday = "thursday"
# wl.thursday_hours = 8.0
# wl.friday = "friday"
# wl.friday_hours = 8.0
# wl.saturday = "saturday"
# wl.saturday_hours = 8.0
# wl.sunday = "sunday"
# wl.sunday_hours = 8.0
# wl.save!

