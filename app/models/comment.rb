class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :cereal

    validates :content, presence: true
end
