class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

    def self.friendship_status(sender, receiver)
        if sender == receiver
            return "yourself"
        end
        check1 =Friendship.where(sender_id: sender, receiver_id: receiver).first(1)[0]
    	if check1 != nil
    		if check1.status == "accepted"
                return "friends"
            elsif check1.status == "pending"
                return "sent"
            end
    	end
    	check2 =Friendship.where(sender_id: receiver, receiver_id: sender).first(1)[0]
    	if check2 != nil
    		if check2.status == "accepted"
                return "friends"
            elsif check2.status == "pending"
                return "received"
            end
    	end
    	"notfriends"
    end

    def self.check_user_request?(user)
        receiver_id=user.id
        return Friendship.exists?(:status => 'pending', :receiver_id => receiver_id)

    end

    def self.get_requests_list(receiver_id)
        requests_list=Friendship.find(:all, :conditions=>{:receiver_id => receiver_id, :status => "pending"})
        return requests_list
    end
end
