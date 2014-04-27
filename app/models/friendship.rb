class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

    def self.friends?(user1, user2)
        Friendship.exists?(sender_id: user1, receiver_id: user2) and Friendship.where(sender_id: user1, receiver_id: user2).first(1).status == "Accepted" or Friendship.exists?(sender_id: user2, receiver_id: user1) and Friendship.where(sender_id: user2, receiver_id: user1).first(1).status == "Accepted";
  	end
end
