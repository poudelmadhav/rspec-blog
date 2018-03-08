class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.valid?
			flash[:success] = "Your post has been created!"
			redirect_to root_path
		else
			flash[:alert] = "Woops! Looks like there has been an error!"
			render :new
		end
	end
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		if @post.valid?
			flash[:success] = "Your post has been updated!"
			redirect_to post_path
		else
			flash[:alert] = "Woops! Looks like there has been an error!"
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:success] = "The post was successfully deleted!"
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :author, :content)
	end
end
