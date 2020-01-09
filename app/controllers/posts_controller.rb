class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = set_post
	end

	def new
		@post = Post.new
	end

	def create
	  @post = set_post
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = set_post
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = set_post
	end

	private

	def set_post
		Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :description)
	end

end
