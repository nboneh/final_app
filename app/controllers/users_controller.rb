class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  def show
    #profile
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # Look up user by unique ID
  end

  def preferences
  end

  def newsfeed
    @requests = Friendship.where(receiver_id: current_user.id, status: "pending").count
    @requestMessage = "#{@requests.to_s} new friend request"
    @requestMessage += "s" if @requests != 1 
    @post = flash[:post]
    @posts = Post.find(:all, :order => 'created_at DESC').first(20)
    @receiverUserId = 0 
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
