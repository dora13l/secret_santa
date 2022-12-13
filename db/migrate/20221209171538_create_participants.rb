class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.bigint "user_id", null: false
      t.bigint "event_id", null: false
      t.index ["event_id"], name: "index_pairs_on_event_id"
      t.index ["user_id"], name: "index_pairs_on_user_id"
      t.timestamps
    end
  end
end
