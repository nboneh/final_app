class FriendshipsController < ApplicationController

    def find
        name=params[:name]
        @options = Array.new
        if(name)
            @options = @options | User.all( :conditions => ["first_name LIKE ?", "#{name}%"])
            @options = @options | User.all( :conditions => ["last_name LIKE ?", "#{name}%"])
            #@options = @options - User.where(id: current_user.id
        else
            @options = User.all
        end
    end

    def create
        friendship =  Friendship.new(:status => "pending",
                                     :sender_id => params[:sender_id],
                                     :receiver_id =>params[:receiver_id])
        friendship.save
        redirect_to :back
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
