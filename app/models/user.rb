class User < ApplicationRecord
    has_many :cereals
    has_many :transactions
    has_many :reviews
    belongs_to :group

    # validates :name, presence: true
    # validates :username, uniqueness: true


end
