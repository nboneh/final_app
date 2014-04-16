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
    end

    def new
    end
end
