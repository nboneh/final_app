class Post < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_pid'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_pid'
  attr_accessible :content
  validates :content, length: { maximum: 140 }
end
