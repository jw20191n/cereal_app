class User < ApplicationRecord
    has_secure_password
    has_many :cereals
    has_many :transactions
    # has_many :reviews
    has_many :comments
    # has_one_attached :avatar
    belongs_to :group, optional: true

    validates :name, presence: true
    validates :username, uniqueness: true

    before_save :make_title_case
    
    def update_total(someamount)
        self.total += someamount.to_i
        self.save
    end

    def subtract_total(someamount)
        self.total -= someamount.to_i
        self.save
    end

    def make_title_case
        self.name = self.name.titlecase
    end

end
