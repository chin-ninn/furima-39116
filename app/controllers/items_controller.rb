class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :charges_id, :area_id, :scheduled_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
