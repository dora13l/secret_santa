class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    #events I created
    @my_events = my_events
    # events i am in
    @participants = @user.participants
    @my_wishlists = my_wishlists
    p "HELLLLOOOOOOOOOO"
    @mypeople = @participants.map do |e|
      [User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).first_name,
      e.event.name,
      Wishlist.find_by(user_id: User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).id),
      Wishlist.find_by(user_id: User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).id)]

    end

    #binding.pry

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
