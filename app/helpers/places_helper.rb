module PlacesHelper
  def day_options_for_select
    Date::DAYNAMES.map.with_index { |d, i| [d, i] }
  end

  def time_options_for_select
    time = Time.parse("2:30 am")

    48.times.map do |i|
      new_time = time + (30 * i).minutes
      [new_time.strftime("%I:%M %p"), new_time.strftime("%R")]
    end
  end

  def humanize_day_range(special)
    if special.start_day == 0 && special.end_day == 6
      "every day"
    elsif special.start_day == special.end_day
      Date::DAYNAMES[special.start_day]
    else
      "#{Date::DAYNAMES[special.start_day]} through #{Date::DAYNAMES[special.end_day]}"
    end
  end

  def humanize_time_range(special)
    starts_at = format_time(special.starts_at)
    ends_at = format_time(special.ends_at)

    "#{starts_at} to #{ends_at}"
  end

  def format_time(db_time)
    Time.parse(db_time).strftime("%l:%M")
  end
end
