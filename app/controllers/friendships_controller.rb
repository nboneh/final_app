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
        params.require(:sender_id)
        params.require(:receiver_id)
        params.require(:status)
        data={}
        data[:sender_id]=params[:sender_id]
        data[:receiver_id]=params[:receiver_id]
        data[:status]=params[:status]
        unless Friendship.friends?(params[:sender_id],params[:receiver_id])
            @friend = Friendship.new(data)
            if @friend.save
                #Swap the sender and receiver
                tmp=data[:sender_id]
                data[:sender_id]=data[:receiver_id]
                data[:receiver_id]=tmp
                data[:status]="accepted"
                Friendship.create(data)
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
