# class User < ApplicationRecord
#   validates_presence_of :email, :message => t('need_email')
#   validate :user_email
#
#   validate :password_size
#   validate :password_lower_case
#   validate :password_uppercase
#   validate :password_contains_number
#
#   def password_size
#     errors.add :password, "{t('password_length')}" if password.size < 8
#   end
#
#   def password_uppercase
#     return if !!password.match(/\p{Upper}/)
#     errors.add :password, "{t('password_capital')}"
#   end
#
#   def password_lower_case
#     return if !!password.match(/\p{Lower}/)
#     errors.add :password, "{t('password_no_capital')}"
#   end
#
#   def password_contains_number
#     return if password.count("0-9") > 0
#     errors.add :password, "{t('password_number')}"
#   end
#
#   def ad_login
#     errors.add :nickname, "{t('exist_nickname')}" unless User.find_by(nickname: nickname).nil?
#   end
#
#   def user_email
#     errors.add :email, "{t('exist_email')}" unless User.find_by(email: email).nil?
#   end
# end

class User < ApplicationRecord
  has_one :rule
  has_many :egg_collection
  has_many :work_list
  has_many :work_shift_schedule

  # validates_presence_of :email, :message => "Email field must not be null"
  # validate :user_email

  validate :password_size
  validate :password_lower_case
  validate :password_uppercase
  validate :password_contains_number

  def password_size
    errors.add :password, "Password length is at least 8 characters" if password.size < 8
  end

  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, "The password must contain one capital letter"
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, "The password must contain one not capital letter"
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, 'The password must contain one number'
  end

  def user_nickname
    errors.add :nickname, 'There is already a user with this \"Nickname\" login' unless User.find_by(nickname: nickname).nil?
  end

  def user_email
    errors.add :email, 'There is already a user with this \"Email\" login' unless User.find_by(email: email).nil?
  end
end
