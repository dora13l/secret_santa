class UsersController < ApplicationController
  def show
    @user = User.new
    @my_events = my_events
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

end
