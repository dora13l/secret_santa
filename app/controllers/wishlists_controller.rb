class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    @item = Item.new
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to wishlist_path(@wishlist)
      flash[:notice] = "Wishlist created!"
    else
      flash.now[:alert] = "Sorry, there was an issue!"
      render :new
    end
  end

  def edit
  end

  def update
    @wishlist.update(wishlist_params)
    redirect_to wishlist_path(@wishlist)
  end

  def destroy
    @Wishlist.destroy
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(
      :name
    )
  end

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end
end
