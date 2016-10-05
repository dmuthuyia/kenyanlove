class ProdController < ApplicationController
  def index
    @prods = Prod.all
    @order_item = current_order.order_items.new
  end
end
