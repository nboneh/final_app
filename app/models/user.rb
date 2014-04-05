class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :interests, :last_name, :password, :picture, :quotes
    has_many :Frindship
    has_many :Post
end
