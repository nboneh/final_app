class PostsController < ApplicationController
	def create
		 @post = Post.new(params[:post])
		 @post.save
		  flash[:post] = @post
		redirect_to :back
	end
end
