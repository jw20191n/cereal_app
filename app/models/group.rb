class Group < ApplicationRecord

    has_many :users
    has_many :cereals, through: :users

    validates :name, :location, presence: true
    validates :name, uniqueness: true

    before_save :make_title_case
    def make_title_case
        self.name = self.name.titlecase
    end
end
