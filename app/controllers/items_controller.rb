class ItemsController < ApplicationController
  def create
    @wishlist = Wishlist.find(params[:wishlist_id])
    @item = Item.new(item_params)
    @item.wishlist = @wishlist
    if @item.save
      redirect_to wishlist_path(@wishlist)
    else
      render "wishlists/show", status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :event_id, :user_id)
  end
end
