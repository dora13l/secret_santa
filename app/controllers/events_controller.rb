class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @participant = Participant.new
    @draw = Draw.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    # binding.pry
    if @event.save
      redirect_to event_path(@event)
      flash[:notice] = "event created!"
    else
      flash.now[:alert] = "Sorry, there was an issue!"
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
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
