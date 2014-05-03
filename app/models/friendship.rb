class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

<<<<<<< HEAD
    def self.friends?(user1, user2)
        my_friends=Friendship.find_by(:sender_id, user1)
        my_friends=my_friends | Friendship.find_by(:sender_id, user2)
        unless(my_friends.nil?) 
               my_friends[:receiver_id] == user2 
        else
            return  false 
=======
    def self.friendship_status(sender, receiver)
        if sender == receiver
            return "yourself"
>>>>>>> 781ee4809ee62336b6be538c3d9e4d67ba7dbb81
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
