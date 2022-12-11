class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:destroy, :update]

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(participant_params)
    @participant.event = @event
    @participant.user = User.find_by(email: participant_params[:email])
    if @participant.save
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def show
    @draw = Draw.new
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def update
    @participant.update!(participant_params)
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
      :first_name,
      :last_name,
      :email,
      :event_id,
      :user_id
    )
  end
end
