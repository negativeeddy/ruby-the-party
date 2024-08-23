class CreateFollowRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :follow_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :message

      t.timestamps
    end
  end
end
