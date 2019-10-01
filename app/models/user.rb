class User < ApplicationRecord
    has_secure_password
    has_many :cereals
    has_many :transactions
    # has_many :reviews
    has_many :comments
    belongs_to :group, optional: true

    # validates :name, presence: true
    # validates :username, uniqueness: true
    
    def update_total(someamount)
        self.total += someamount
        self.save
        return
    end


end
