class PostsController < ApplicationController
	def new
		@post = Post.new
		@categories = Category.all
		@post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to post_path(@post)
		else
			@categories = Category.all
			@post.post_images.build
			render :new
		end

	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
		
		new_history = @post.browsing_histories.new
    	new_history.user_id = current_user.id
    	if current_user.browsing_histories.exists?(post_id: "#{params[:id]}")
			old_history = current_user.browsing_histories.find_by(post_id: "#{params[:id]}")
			old_history.destroy
	    end
	    new_history.save

	    histories_stock_limit = 10
	    histories = current_user.browsing_histories.all
	    if histories.count > histories_stock_limit
	      histories[0].destroy
	    end
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			@post_comment = PostComment.new
			render :show
		else
			@categories = Category.all
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user)
	end

	def index
	    if  params[:tag_name]
	    	@posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc)
	    	@posts.each do |post|
	    		post.tags.each do |tag|
	    			@tag_name = tag.name
	    			if params[:tag_name] == @tag_name
	    				@tag = @tag_name
	    			end
	    		end
	    	end
	    end
	end

	private
	def post_params
		params.require(:post).permit(:user_id, :title, :category_id, :image, :content, :place, :tips, :course, :tag_list, post_images_images: [])
	end
end
