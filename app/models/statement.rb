class Statement < ApplicationRecord
    validates :income, :expenditure, :month, presence: true
end
