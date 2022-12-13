class AddLocationAndDateToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :location, :string
    add_column :events, :date, :datetime
  end
end
