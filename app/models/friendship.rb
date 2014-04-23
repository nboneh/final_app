class Friendship < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
    attr_accessible :status, :sender_id, :receiver_id

    def self.friends?(user1, user2)
        my_friends=Friendship.find_by(sender_id: user1)
        unless(my_friends.nil?)
            my_friends.find_by(receiver_id: user2).nil?
        else
            false
        end
    end
end
