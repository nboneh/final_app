class FriendshipsController < ApplicationController

    def find
        name=params[:name]
        if(!name.nil?)
            @options = Array.new
            @options = @options | User.where(first_name: name)
            @options = @options | User.where(last_name: name) 
            @options = @options | User.where(email: name)
        end
    end

    def create
        params[:status] = "pending"
        params[:sender_id] = current_user.id
        params.require(:sender_id)
        params.require(:receiver_id)
        params.require(:status)
        unless Friendship.friends?(params[:sender_id],params[:receiver_id])
            @friend = Friendship.new(params[:post])
            if @friend.save
                redirect_to newsfeed_path 
            end
        else
            flash[:failed] = "You and #{params[:receiver_id]} are already friends"
            redirect_to findfriends_path
        end
    

    end

    def new
    end
end
