class UsersController < ApplicationController
  def index
  end

  def show
    # get the user
    @user = User.find(params[:id])
    # events I created
    @my_events = my_events
    # my wish list
    @my_wishlists = my_wishlists
    # events i am in
    @participants = @user.participants
    # binding.pry
    # events has many participants
    # event has many draws
    # gifter is the current user and they want to grab whoever is their receiver in each event
    @mypeople = @participants.map do |e|
      [e.event.name,
      e.event.location,
      e.event.price,
      User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).first_name,
      Wishlist.find_by(user_id: User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).id),
      Wishlist.find_by(user_id: User.find(e.event.draws.find_by(gifter: current_user.id.to_s).receiver.to_i).id),
    e.event.date]
    end
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
