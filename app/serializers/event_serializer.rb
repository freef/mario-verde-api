class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date
  belongs_to :user
end
