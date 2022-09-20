class Operation < ApplicationRecord
    belongs_to :user
    has_many :groups, through: :group_operations
end
