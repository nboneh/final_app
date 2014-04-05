class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :status
      t.references :sender
      t.references :receiver

      t.timestamps
    end
    add_index :friendships, :sender_id
    add_index :friendships, :receiver_id
  end
end
