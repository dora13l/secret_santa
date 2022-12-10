class AddUserParticipants < ActiveRecord::Migration[7.0]
  def change
    add_reference :participants, :user, index: true, foreign_key: true
  end
end
