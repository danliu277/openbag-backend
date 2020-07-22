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
            purchase_orders.push(PurchaseOrder.create(po))
        end
        render json: purchase_orders
    end
end
