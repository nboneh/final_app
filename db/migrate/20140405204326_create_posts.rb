class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.references :sender
      t.references :receiver

      t.timestamps
    end
    add_index :posts, :sender_id
    add_index :posts, :receiver_id
  end
end
