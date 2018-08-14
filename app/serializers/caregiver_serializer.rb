class CaregiverSerializer < ActiveModel::Serializer
  attributes :id
  has_many :dailylogs
end
