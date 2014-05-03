class SessionController < ApplicationController
  skip_before_filter :require_login
  def new
	end

  	def create
        mysession = params[:session]
  		user = User.find_by_email(mysession[:email].downcase)
  		if user && user.authenticate(mysession[:password])
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
	    sign_out
	    redirect_to login_path
  	end
end
