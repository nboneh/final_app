class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :interests, :last_name, :password, :picture, :quotes, :id
  has_many :sent_friendships, :class_name => 'Friendship', :foreign_key => 'sender_fid' 
  has_many :received_friendships, :class_name => 'Friendship', :foreign_key => 'receiver_fid' 
  has_many :sent_posts, :class_name => 'Post', :foreign_key => 'sender_pid' 
  has_many :received_posts, :class_name => 'Post', :foreign_key => 'receiver_pid' 


end
