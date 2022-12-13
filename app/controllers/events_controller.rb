class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    # want to show the participants on the event show page
    @participant = Participant.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
      flash[:notice] = "event created!"
    else
      flash.now[:alert] = "Sorry, there was an issue!"
      render :new
    end
  end

  def edit
    # get the form
  end

  def update
    # patch the form
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :location,
      :price,
      :date
    )
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
