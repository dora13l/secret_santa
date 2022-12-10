class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:destroy, :update]

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(participant_params)
    @participant.event = @event
    #@user = current_user

    @participant.user = User.find(params[:first_name])
    #@user = User.where(first_name: params[:first_name])
    if @participant.save
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def update
    @user = User.find(params[:first_name])
    @participant.user = @user
    @participant.update!(participant_params)
    render partial: "shared/participant", locals: {item: @participant}
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
