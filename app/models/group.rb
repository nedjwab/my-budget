class Group < ApplicationRecord
    belongs_to :user
    has_many :operations, through: :group_operations
end
