class EventAttendance < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'attendee'
  belongs_to :event, class_name: 'Event', foreign_key: 'attended_event'

end
