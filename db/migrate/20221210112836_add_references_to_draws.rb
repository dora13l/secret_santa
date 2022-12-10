class AddReferencesToDraws < ActiveRecord::Migration[7.0]
  def change
    add_reference :draws, :participant, index: true, foreign_key: true
    add_reference :draws, :user, index: true, foreign_key: true
  end
end
