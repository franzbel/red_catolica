class PostsController < ApplicationController
  def create
    # render(:text => params[:post])
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to profile_path(@post.user.name)
  end
  private
  def post_params
    params.require(:post).permit(:body)
  end
end
