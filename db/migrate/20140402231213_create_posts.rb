class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.time :post_time
      t.string :content

      t.timestamps
    end
  end
end
