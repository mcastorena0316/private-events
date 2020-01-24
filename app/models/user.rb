class User < ApplicationRecord
    has_many :events, foreign_key: 'creator', dependent: :destroy 
    validates :name, presence: true
    validates :email, presence: true,  uniqueness: true


    def feed
    events
    end
end
