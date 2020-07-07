class Vendor < ApplicationRecord
    has_many :purchase_orders
end
