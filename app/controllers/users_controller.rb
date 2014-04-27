class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  def show
    #profile
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # Look up user by unique ID
  end

  def preferences
    #id = params[:id]
    #id=current_user.id
   # @user = User.find(id)
   @user=current_user
    if Friendship.check_user_request?(@user)
      flash[:request]="You have some friend requests"
    else
      flash[:request]="You don't have any friend requests"
    end
  end

  def newsfeed
      @post = flash[:post]
    @posts = Post.find(:all, :order => 'created_at DESC').first(20)
    @receiverUserId = 0 
  end

  def login
  end

  def update
    @user=current_user
    #user_id=@user.id
    #print params[:intersts]
    #if User.update_in_quo(user_id, params[:intersts], params[:quotes])
    if @user.update_attribute('interests', params[:user][:interests]) && @user.update_attribute('quotes', params[:user][:quotes])
      flash[:update_success] = "Update Successful!"
      redirect_to newsfeed_path
    else
      flash[:update_fail] = "Update Fail!"
      redirect_to preferences_path
    end

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
