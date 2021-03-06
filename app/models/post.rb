class Post < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_pid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_pid'
  attr_accessible :content, :receiver_id, :sender_id
  validates :content, length: { maximum: 140 }
  validates :content, length: { minimum: 5 }
end
