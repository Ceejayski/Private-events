class User < ApplicationRecord
  # has_many :events, inverse_of: :creator
  # has_many :attendances, dependent: :destroy
  # has_many :attended_events, class_name: 'Event', foreign_key: 'event_id', through: :attendances

  has_many :events, inverse_of: :creator
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
end
