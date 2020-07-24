class PurchaseOrdersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        purchase_orders = PurchaseOrder.all
        render json: purchase_orders
    end

    def show
        purchase_order = PurchaseOrder.find(params[:id])
        render json: purchase_order
    end

    def create_purchase_orders
        purchase_orders = []
        params['purchaseOrders'].each do |po|
            purchase_order = PurchaseOrder.create(
                game_id: po['game_id'],
                employee_id: po['employee_id'],
                quantity: po['quantity'],
                vendor_id: po['vendor_id']
            )
            if purchase_order.id != nil
                purchase_orders.push(purchase_order)
                game = Game.find(purchase_order.game_id)
                game.stock += purchase_order.quantity
                game.save
            end
        end
        render json: purchase_orders
    end
end
