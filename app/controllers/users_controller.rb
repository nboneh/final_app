class UsersController < ApplicationController
  def profile
  end

  def preferences
  end

  def newfeed
  end

  def new
  	#@user = User.new(params[:user])
  	@user = User.new(user_params)
  	if @user.save
      # Handle a successful save.
      flash[:success] = "Register Successful!"
      redirect_to :controller => 'session', :action => 'new'
    else
      render 'new'
    end
  end

  def create
  	#@user = User.new(params[:user])
  	@user = User.new(user_params)
  	if @user.save
      # Handle a successful save.
      flash[:success] = "Register Successful!"
      redirect_to :controller => 'session', :action => 'new'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password) if params[:user]
    end
end