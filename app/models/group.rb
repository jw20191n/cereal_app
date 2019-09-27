class Group < ApplicationRecord

    has_many :users
    has_many :cereals, through: :users

    validates :name, :location, presence: true
    validates :name, uniqueness: true
end
