class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :interests
      t.string :last_name
      t.string :password
      t.string :picture
      t.string :quotes

      t.timestamps
    end
  end
end
