class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

    def self.friends?(user1, user2)
        my_friends=Friendship.find_by(:sender_id, user1)
        my_friends=my_friends | Friendship.find_by(:sender_id, user2)
        unless(my_friends.nil?) 
               my_friends[:receiver_id] == user2 
        else
            return  false 
        end
    end
end
