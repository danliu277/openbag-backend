class Sale < ApplicationRecord
    belongs_to :customer
    belongs_to :employee
    belongs_to :game
end
