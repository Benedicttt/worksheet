module WorkListsHelper
  def get_time_from_minutes(time)
    hours   = time.to_i / 60
    minutes = time.to_i % 60
    { hours: hours, minutes: minutes }
  end
end
