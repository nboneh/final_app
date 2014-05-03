class UsersController < ApplicationController
    skip_before_filter :require_login, :only => [:new, :create]
    def show
        #profile
        id = params[:id] # retrieve user ID from URI route
        @user = User.find(id) # Look up user by unique ID
        @status = Friendship.friendship_status(current_user.id, @user.id)
        if @status == "yourself" or  @status == "friends"
        @post = flash[:post]
        @posts = Post.where(:receiver_id=>id).order('created_at DESC').first(20)
    end
    end

    def preferences
        #id = params[:id]
        #id=current_user.id
        # @user = User.find(id)
        if  flash[:user] != nil
            @user = flash[:user]
            @update = 1
        else
            @user=current_user
        end
        if Friendship.check_user_request?(@user)
            flash[:request]="You have some friend requests"
            @requests_list=Friendship.get_requests_list(@user.id)
        else
            flash[:request]="You don't have any friend requests"
        end

        @friends = []
        preFriends = Friendship.where(:receiver_id=>current_user.id)
        preFriends.each do |friend|
            status = Friendship.friendship_status(current_user.id, friend.sender_id)
            if status == "friends"
                @friends << User.find(friend.sender_id)
            end
        end
         preFriends = Friendship.where(:sender_id=>current_user.id)
        preFriends.each do |friend|
        status = Friendship.friendship_status(current_user.id, friend.sender_id)
            if status == "friends"
            @friends << User.find(friend.receiver_id)
            end
        end

    end

    def newsfeed
        @post = flash[:post]
        prePosts = Post.where(:receiver_id=>0).order('created_at DESC')
        @posts = []
        prePosts.each do |post|
            status = Friendship.friendship_status(current_user.id, post.sender_id)
            if status == "friends" or status == "yourself"
                @posts << post
            end
            if @posts.count >= 20
                break;
            end
        end
    end

    def login
    end

    def update
        @user = current_user
        #user_id=@user.id
        #print params[:intersts]
        #if User.update_in_quo(user_id, params[:intersts], params[:quotes])
        if params[:user][:picture] == ""
            params[:user][:picture] = @user.picture
        end
        if  @user.update_attributes( params[:user])
            flash[:update_success] = "Update Successful!"
            redirect_to user_path(@user.id)
        else
            flash[:update_fail] = "Update Fail!"
            flash[:user] = @user
            redirect_to preferences_path
        end

    end

    def new
        myflash=flash[:userReg]
        if myflash == nil
            @user = User.new(user_params)
        else
            @user = myflash 
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
