class Employee < ApplicationRecord
    has_secure_password

    has_many :sales
    has_many :purchase_orders
end
