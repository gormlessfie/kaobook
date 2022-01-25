class PostsController < ApplicationController
  def index
    @friends = current_user.accepted_friends + current_user.inverse_accepted_friends
    @friends << current_user

    @posts = Post
      .where(user_id: @friends)
      .includes(:user, { user: { profile: { detail: :name }}},
                :likes,
                :comments, { comments: { user: { profile: { detail: :name, avatar_attachment: :blob }}}})
      .order(created_at: :desc)

    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:succes] = 'Post successful'
      redirect_to posts_path
    else
      flash[:error] = 'Post must contain something.'
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = 'Post deleted.'
    redirect_to posts_path
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
