class Special < ActiveRecord::Base
  belongs_to :place

  TIME_FORMAT = /\A([0-1]\d|2[0-3]):[0-5]\d\z/

  validates :place, presence: true
  validates :starts_at, format: { with: TIME_FORMAT }
  validates :ends_at, format: { with: TIME_FORMAT }
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :details, presence: true

  def available_now?
    wday = Time.zone.now.wday
    time = Time.zone.now.strftime("%H:%M")

    if starts_at < ends_at
      (starts_at...ends_at) === time && (start_day..end_day) === wday
    else
      # The special ends after midnight
      if time > "02:00"
        (starts_at.."23:00") === time && (start_day..end_day) === wday
      else
        ("00:00"...ends_at) === time && (start_day..end_day) === (wday - 1)
      end
    end
  end
end
