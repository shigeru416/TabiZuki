class Admins::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def tag
    @posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc).page(params[:page])
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
