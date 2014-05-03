class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  before_filter :require_login
   before_filter :friend_requests

# private

   def require_login
       unless signed_in?
           redirect_to login_path
       end
   end

   def friend_requests
   	if signed_in?
   		@requests = Friendship.where(receiver_id: current_user.id, status: "pending").count
   		 if @requests != 0
        @requestMessage = "#{@requests.to_s} new friend request"
        if @requests != 1
        	@requestMessage += "s" 
    	 end
    	end
    end
    end
end