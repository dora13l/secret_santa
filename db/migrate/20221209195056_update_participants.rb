class UpdateParticipants < ActiveRecord::Migration[7.0]
  def change
    remove_reference :participants, :event
  end
end
