class Friendship < ActiveRecord::Base
  attr_accessible :status
  belongs_to :User
  belongs_to :User
end
