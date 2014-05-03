class FriendshipsController < ApplicationController

    def find
        name=params[:name]
        if(!name.nil?)
            @options = Array.new
            @options = @options | User.where(first_name: name)
            @options = @options | User.where(last_name: name) 
            @options = @options | User.where(email: name)
#@options = @options - User.where(id: current_user.id)
        end
    end

    def create
        params[:status] = "pending"
        params[:sender_id] = current_user.id
        params.require(:receiver_id)
        data={}
        data[:status] = params[:status]
        data[:sender_id] = params[:sender_id]
        data[:receiver_id] = params[:receiver_id]
        unless Friendship.friends?(params[:sender_id],params[:receiver_id])
            @friend = Friendship.new(data)
            if @friend.save
                redirect_to newsfeed_path
            else
                flash[:failed] = "Failed to create a friendship"
            end
        else
            flash[:failed] = "You and #{params[:receiver_id]} are already friends"
            redirect_to findfriends_path
        end
    end

    def update
        friendship_id=params[:id]
        friendship=Friendship.find_by_id(friendship_id)
        friendship.update_attribute('status', "accepted")
        redirect_to :back
     end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        redirect_to :back
     end

    def new
    end
end
