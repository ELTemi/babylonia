class MomSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :babies
  has_many :dailylogs
end
