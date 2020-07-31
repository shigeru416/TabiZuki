class WannagoListsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    wannago_list = current_user.wannago_lists.new(post_id: @post.id)
    wannago_list.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    wannago_list = current_user.wannago_lists.find_by(post_id: @post.id)
    wannago_list.destroy
  end
end
