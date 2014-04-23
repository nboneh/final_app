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
        params.require(:status, :receiver_id,:sender_id)
        @friend = Friend.new(params[:post])
        if @friend.save
            redirect_to newsfeed 
        end

    end

    def new
    end
end
