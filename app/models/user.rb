class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :interests, :last_name, :password, :picture, :quotes
end
