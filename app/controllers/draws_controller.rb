class DrawsController < ApplicationController
  before_action :set_draw, only: [:destroy , :update]

  def make
    @event = Event.find(params[:event_id])
    players = @event.participants
    # binding.pry
    # players is an array of objects
    @pair = secret(players)
    # draws is a hash value so I want to create each key as the receiver in the draw table, and the value as the gifter in the table
    @draws = @pair.map do |key, value|
      Draw.create!(event: @event, receiver: User.find(key).id, gifter: User.find(value).id)
    end
  end

  def secret(names)
    done_receiver = []
    pairs = {}
    names.each do |name|
      gifter = name
      receiver = (names - [gifter] - done_receiver).sample
      # pulls the user_id in each object inside the array
      pairs[gifter.user_id] = receiver.user_id
      done_receiver << receiver
    end
    return pairs
  end

  private

  def set_draw
    @draw = Draw.find(params[:id])
  end

  def draw_params
    params.require(:draw).permit(
      :gifter,
      :reciever,
      :participant_id,
      :event_id
    )
  end
end
