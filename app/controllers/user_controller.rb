class UserController < ApplicationController
  def profile
  end

  def preferences
  end

  def newfeed
  end

  def new
  	@user = User.new
  end
end
