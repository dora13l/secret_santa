class AddReferenceToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_reference :participants, :event, index: true, foreign_key: true
  end
end
