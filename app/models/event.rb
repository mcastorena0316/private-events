class Event < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'creator'
    validates :eventname, presence: true
    validates :description, presence: true
end
