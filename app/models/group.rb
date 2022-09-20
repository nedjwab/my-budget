class Group < ApplicationRecord
    belongs_to :user
    has_many :operations, through: :group_operations
    validates :name,:icon, presence: true , length: { in: 1..100 }
end
