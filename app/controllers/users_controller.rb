class UsersController < ApplicationController
  def profile
  end

  def preferences
  end

  def newfeed
  end

  def login
  end

  def new
    @user = User.new(user_params)
  end


    def create
        #@user = User.new(params[:user])
    @user = User.new(params[:user])
    if @user.save
          # Handle a successful save.
            flash[:success] = "Register Successful!"
            redirect_to "/login"
    else
      flash[:error] = "Register Failed!"
      redirect_to "/register"
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password) if params[:user]
    end
end
