class PostsController < ApplicationController
	def create
		 @post = Post.new(:content =>params[:content],
		 	:sender_id => params[:sender_id],
		 	:receiver_id =>params[:receiver_id])
		 @post.save
		  flash[:post] = @post
		redirect_to :back
	end

	def destroyall
		 posts = Post.where(:receiver_id => current_user.id)
         posts.each do |post|
         	post.destroy
         end
		redirect_to user_path(current_user)
	end
end
