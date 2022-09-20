class Operation < ApplicationRecord
    belongs_to :user
    has_many :groups, through: :group_operations
    validates :name, presence: true , length: { in: 1..100 }
    validates :amount, numericality: { :greater_than_or_equal_to: 0 }
end
