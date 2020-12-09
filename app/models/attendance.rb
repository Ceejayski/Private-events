class Attendance < ApplicationRecord
  # belongs_to :attendee, class_name: 'User', foreign_key: 'user_id'
  # belongs_to :attended_event, class_name: 'Event', foreign_key: 'event_id'

  enum status: { invited: 0, accepted: 1 }
  belongs_to :event
  belongs_to :user
end
