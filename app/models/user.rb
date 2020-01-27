class User < ApplicationRecord
    has_many :events, foreign_key: 'creator', dependent: :destroy 
    has_many :event_attendance, foreign_key: 'attendee'
    has_many :attended_event, through: :event_attendance, source: 'Event'

    validates :name, presence: true
    validates :email, presence: true,  uniqueness: true


    def feed
    events
    end
end
