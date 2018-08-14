class DailylogSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :baby
  belongs_to :caregiver
end
