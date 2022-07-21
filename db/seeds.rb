user = User.new

user.first_name = "admin"
user.last_name = ""
user.email = "admin@admin"
user.nickname = "admin"
user.phone = ""
user.telegram = ""
user.password = "Admin1234"
user.edit_user = true
user.edit_all_work_list = true
user.edit_all_eggs_collection = true
user.save!