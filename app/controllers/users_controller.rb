class UsersController < ApplicationController
  def show
  #profile
  end

  def preferences
  end

  def newsfeed
    if !signed_in?
      redirect_to login_path
    end
  end

  def login
  end

  def new
    if flash[:userReg] == nil
      @user = User.new(user_params)
    else 
      @user = flash[:userReg]
    end
  end


def create
        #@user = User.new(params[:user]
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Register Successful!"
      redirect_to login_path
    else
      flash[:error] = "Register Failed!"
      flash[:userReg] = @user
      redirect_to register_path
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password) if params[:user]
    end
end
