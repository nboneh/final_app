class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

    def self.friends?(user1, user2)
    	check1 =Friendship.where(sender_id: user1, receiver_id: user2).first(1)[0]
    	if check1 != nil
    		return check1.status == "accepted"
    	end
    	check2 =Friendship.where(sender_id: user2, receiver_id: user1).first(1)[0]
    	if check2 != nil
    		return check2.status == "accepted"
    	end
    	false
    end
end
