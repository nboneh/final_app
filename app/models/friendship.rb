class Friendship < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_fid'
  belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_fid'
  attr_accessible :status
end
