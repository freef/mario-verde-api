# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :readtime, :time
  belongs_to :user

  def readtime
    object.time.to_s[11..15]
  end
end
