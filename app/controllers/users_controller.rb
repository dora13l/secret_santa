class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @my_events = my_events
    @participants = @user.participants
    @my_wishlists = my_wishlists
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def my_events
    @my_events = Event.where(user_id: current_user)
  end

  def my_wishlists
    @my_wishlists = Wishlist.where(user_id: current_user)
  end
end
