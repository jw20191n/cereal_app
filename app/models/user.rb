class User < ApplicationRecord
    has_secure_password
    has_many :cereals
    has_many :transactions
    has_many :reviews
    belongs_to :group, optional: true

    # validates :name, presence: true
    # validates :username, uniqueness: true
    


end
