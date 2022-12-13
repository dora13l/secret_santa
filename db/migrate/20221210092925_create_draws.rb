class CreateDraws < ActiveRecord::Migration[7.0]
  def change
    create_table :draws do |t|
      t.references :event, null: false, foreign_key: true
      t.string :receiver
      t.string :gifter

      t.timestamps
    end
  end
end
