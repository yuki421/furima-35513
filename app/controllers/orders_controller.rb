class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  
  def order_address_params
    params.require(:order_address).permit(:city, :street_number, :building, :prefecture_id, :postal_code, :phone).merge(user_id: current_user.id)
  end
end
