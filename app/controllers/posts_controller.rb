class PostsController < ApplicationController
	def create
		 @post = Post.new(:content =>params[:content],
		 	:sender_id => params[:sender_id],
		 	:receiver_id =>params[:receiver_id])
		 @post.save
		  flash[:post] = @post
		redirect_to :back
	end
end
