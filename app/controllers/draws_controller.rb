class DrawsController < ApplicationController
  before_action :set_draw, only: [:destroy , :update]

  def make
    @event = Event.find(params[:event_id])
    players = @event.participants
    # Get an arrray of participants
    @pair = secret(players)
    @draws = @pair.map do |key, value|
      Draw.create!(event: @event, receiver: User.find(key).id, gifter: User.find(value).id)
    end

  end

  def show
    # # For every draw
    # d1 = @draws.first
    # # Grab what the event_id is
    # event = d1.event_id
    # # match the receiver.to_i to a user.id
    # d1.receiver.to_i
    # receiver = User.find_by(id: d1.receiver.to_i)
    # # match the gifter.to_i to a user_id
    # d1.gifter.to_i
    # #gifter = User.find_by(id: d1.gifter.to_i)
    # # Then show the name of the receiver on the gifter's profile page for that event
    # #On gifters profile page:
    # "You are #{receiver[:first_name]}'s santa for #{Event.find_by(id: d1.event).name}"
    # # e.g you are #{Jacks} secret santa for this event_id
    # get items inside here : Wishlist.find_by(user_id: d1.receiver.to_i)
    # # ALSO show their wishlist on their profile
  end

  def secret(names)
    done_receiver = []
    pairs = {}
    names.each do |name|
      gifter = name
      receiver = (names - [gifter] - done_receiver).sample
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
      :user_id,
      :event_id
    )
  end
end
