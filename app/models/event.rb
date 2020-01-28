class Event < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'creator'
  has_many :event_attendance, foreign_key: 'attended_event'
  has_many :attendee, through: :event_attendance, source: 'User'

  scope :previous_events, -> { where('date < ?', current_time = DateTime.now) }
  scope :upcoming_events, -> { where('date >= ?', current_time = DateTime.now) }

  validates :eventname, presence: true
  validates :description, presence: true
end
