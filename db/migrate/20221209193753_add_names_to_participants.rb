class AddNamesToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :first_name, :string
    add_column :participants, :last_name, :string
    add_column :participants, :email, :string
  end
end
