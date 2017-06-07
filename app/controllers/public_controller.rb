class PublicController < ApplicationController
  skip_before_action :authenticate_request
  POSTS_PER_PAGE = 3
  
  def home
    # Only 2 posts on main page
    # This is managed by client (fix if not)
    @posts = Post.all
    render json: @posts, status: :ok, include: 'cover'
  end

  def blog
    # To see the page use smth like: /blog?page=2
    page = params[:page].blank? ? 1 : params[:page].to_i
    @posts = Post
             .sorted
             .offset( (page-1) * POSTS_PER_PAGE )
             .limit(POSTS_PER_PAGE)
    render json: @posts, status: :ok, include: ['tags', 'cover']
  end

  def portfolio
    @portfolio = PortfolioImage.sorted
    render json: @portfolio, status: :ok
  end

  def show_post
    permalink = params[:permalink]
    @post = Post.where(:permalink => permalink).first
    if @post.blank?
      render status: not_found
    else
      render json: @post, status: :ok
    end
  end

  def like_post
    permalink = params[:permalink]
    @post = Post.where(:permalink => permalink).first
    if @post.blank?
      render status: not_found
      return
    end
    # in params there must be an IP of the user who likes the post
    if !@post.likes.where(:user_ip => params[:ip]).blank?
      render status: :not_acceptable # 406
    else
      # FIXME think about it
      Like.create(:user_ip => params[:ip], :post_id => @post.id)
      render status: :ok
    end
  end
  
  private
  
  def contacts_params
    params
      .require(:message)
      .permit(:phone_number, :email, :text, :name, :theme)
  end
end
