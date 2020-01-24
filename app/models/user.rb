class User < ApplicationRecord
    has_many :events
    validates :name, presence: true
    validates :email, presence: true,  uniqueness: true
end
