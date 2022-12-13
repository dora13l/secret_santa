class ItemsController < ApplicationController
  def create
    @wishlist = Wishlist.find(params[:wishlist_id])
    @item = Item.new(item_params)
    @item.wishlist = @wishlist

    respond_to do |format|
      if @item.save
        format.html { redirect_to wishlist_path(@wishlist) }
        format.json
      else
        format.html { render "wishlists/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:product)
  end
end
