class Event < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'creator'
    validates :name, presence: true
    validates :description, presence: true
end
