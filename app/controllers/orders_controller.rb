class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if OrderAddress.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :area, :city, :house_number, :building_name, :phone_number, :price
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
