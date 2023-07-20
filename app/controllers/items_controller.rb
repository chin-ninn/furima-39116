class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: 'DESC')
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :charges_id, :area_id, :scheduled_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
