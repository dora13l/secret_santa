class ParticipantssController < ApplicationController
  before_action :set_participant, only: [:destroy, :update]

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participants.new(participant_params)
    @participant.user_id = @user.id
    if @participant.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      puts @participant.errors.full_messages
      puts "something went wrong"
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def update
    @participant.update!(participant_params)
    render partial: "shared/participant", locals: {item: @participant}
  end

  private

  def set_participant
    @participant = Participants.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
      :user_id, :event_id
    )
  end
end
