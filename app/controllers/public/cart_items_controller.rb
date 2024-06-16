class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    in_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if in_item.present?
      in_item.amount += @cart_item.amount.to_i
      in_item.update(amount: in_item.amount)
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
