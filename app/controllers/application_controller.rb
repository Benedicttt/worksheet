class ApplicationController < ActionController::Base

  include SessionsHelper

  before_action :set_locale

  def extract_locale
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_minutes_from_full_time(time)
    parse_time = time.split(":")
    hours   = parse_time[0].to_i
    minutes = parse_time[1].to_i

    (hours * 60) + minutes
  end

  def get_time_from_minutes(time)
    hours   = time.to_i / 60
    minutes = time.to_i % 60
    { hours: hours, minutes: minutes }
  end
end
