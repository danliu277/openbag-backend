class Game < ApplicationRecord
    has_many :sales
    has_many :purchase_orders
end
