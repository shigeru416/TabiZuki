class PostsController < ApplicationController
	def new
		@post = Post.new
		@categories = Category.all
		@post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		@post_comment = PostComment.new
		render :show
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		@post_comment = PostComment.new
		render :show
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	private
	def post_params
		params.require(:post).permit(:user_id, :title, :category_id, :image, :content, :place, :tips, :course, :tag_list, post_images_images: [])
	end
end
