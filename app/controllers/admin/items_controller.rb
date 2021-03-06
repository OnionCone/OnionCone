class  Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to item_path(item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_deleted, :image_id)
  end
end