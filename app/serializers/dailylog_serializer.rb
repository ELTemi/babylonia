class DailylogSerializer < ActiveModel::Serializer
  attributes :id, :date_format_for_time_in, :time_in_format, :nap, :meal, :diaper, :play_time, :summary, :meds, :time_out_format
  belongs_to :baby
  belongs_to :caregiver
end
