class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] #:destroy
  before_action :find_params, only: [:show, :edit, :update]
  before_action :login_condition, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
  def find_params
    @item = Item.find(params[:id])
  end

  def login_condition
    current_user.id == @item.user_id
  end
end
