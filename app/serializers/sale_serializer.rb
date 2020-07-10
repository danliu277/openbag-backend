class SaleSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :employee
  belongs_to :customer
  belongs_to :game
end
