class FriendshipsController < ApplicationController
  def find
      name=params[:user]
      #@options = Array.new
      #@options = options | User.find_by(first_name: name)
      #@options = options | User.find_by(last_name: name) 
      #@options = options | User.find_by(email: name)
  end

  def create
  end

  def new
  end
end
