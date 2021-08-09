class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params
  before_action :sold_out_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid? 
      item_pay
      @order_address.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  
  def order_address_params
    params.require(:order_address).permit(:city, :street_number, :building, :prefecture_id, :postal_code, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end

  def sold_out_item
    if @item.order.present? || current_user.id == @item.user_id
        redirect_to root_path
    end
  end
end
