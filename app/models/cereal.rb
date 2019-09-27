class Cereal < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :reviews
    delegate :group, to: :user

    get_cereal_image = blah
end
