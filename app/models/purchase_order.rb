class PurchaseOrder < ApplicationRecord
    belongs_to :employee
    belongs_to :vendor
    belongs_to :game
end
