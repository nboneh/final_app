class Post < ActiveRecord::Base
  attr_accessible :content, :post_time
  belongs_to :User
  belongs_to :User
end
