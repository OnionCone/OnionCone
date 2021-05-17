class  Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to "/admin/items/new"
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to todolist_path(item.id)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_deleted)
  end
end
