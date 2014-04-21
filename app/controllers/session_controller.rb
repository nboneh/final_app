class SessionController < ApplicationController
  skip_before_filter :require_login
  def new
	end

  	def create
  		user = User.find_by_email(params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
	    	# Sign the user in and redirect to the user's show page.
	     	sign_in user
      		redirect_to newsfeed_path
	    else
	    	# Create an error message and re-render the signin form.
	    	flash[:failed] = true
            redirect_to login_path
	  	end
  	end

  	def destroy
  		current_user = nil
  	end
end
