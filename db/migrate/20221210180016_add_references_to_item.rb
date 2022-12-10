class AddReferencesToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :user, index: true, foreign_key: true
  end
end
