user = User.new
rules = Rule.new

user.first_name = "admin"
user.last_name = ""
user.email = "admin@admin"
user.nickname = "admin"
user.phone = ""
user.telegram = ""
user.password = "Admin1234"
user.save!

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

//
user = User.new
rules = Rule.new

user.first_name = "Serhii"
user.last_name = "Kiyvskyi"
user.email = "benedicttt270519873@gmail.com"
user.nickname = "benedicttt"
user.phone = "044 984-72-54"
user.telegram = "@SergeyK2705"
user.password = "Folken123123"
user.save!

rules.user_id = user.id
rules.manager = false
rules.worker = true
rules.create_user = false
rules.edit_user = false
rules.edit_all_work_list = false
rules.edit_work_list = true
rules.edit_all_eggs_collection = false
rules.edit_eggs_collection = true
rules.save!

//
wl = WorkShiftSchedule.new
wl.user_id = user.id
wl.period_date = "period_date"
wl.monday = "monday"
wl.tuesday = "tuesday"
wl.wednesday = "wednesday"
wl.thursday = "thursday"
wl.friday = "friday"
wl.saturday = "saturday"
wl.sunday = "sunday"
wl.save