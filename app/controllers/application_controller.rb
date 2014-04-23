class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  before_filter :require_login

# private

   def require_login
       unless signed_in?
           redirect_to login_path
       end
   end
end