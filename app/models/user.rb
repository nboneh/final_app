class User < ActiveRecord::Base
	include SessionHelper
  attr_accessible :email, :first_name, :interests, :last_name, :password, :picture, :quotes, :id, :password_confirmation
  has_many :sent_friendships, :class_name => 'Friendship', :foreign_key => 'sender_fid' 
  has_many :received_friendships, :class_name => 'Friendship', :foreign_key => 'receiver_fid' 
  has_many :sent_posts, :class_name => 'Post', :foreign_key => 'sender_pid' 
  has_many :received_posts, :class_name => 'Post', :foreign_key => 'receiver_pid' 
	
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence:true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
	validates :password, length: {minimum: 6}
	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.hash(token)
    	Digest::SHA1.hexdigest(token.to_s)
 	end
	#def self.authenticate(email, password) 
    	#find(:email, :password, :conditions=>["email = ? AND password = ?", email, password])
    #end


	private

	  def create_remember_token
	    # Create the token.
	    self.remember_token = User.hash(User.new_remember_token)
	  end
end	
