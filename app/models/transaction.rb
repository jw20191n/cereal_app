class Transaction < ApplicationRecord

    # belongs_to :giver, class_name: 'User'
    # belongs_to :taker, class_name: 'User'
    belongs_to :user
    belongs_to :cereal
    
    validates :amount, numericality: {greater_than: 0, only_integer:true}
    
end



