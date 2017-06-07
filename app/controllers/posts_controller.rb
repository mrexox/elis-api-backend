class PostsController < ApplicationController
  def index
    @posts = Post.sorted
    render json: @posts, include: ['tags', 'cover'] # must include tags (and maybe likes)
  end

  def show
    @post = Post.find(params[:id])
    rj @post
  end

  # This is how POST request should look like.
  # It is not JSONAPI. FIXME here.
  # Also you don't get an image_id with GET but 
  # should sent it with POST. FIXME please.
  # {
  # 	"post": {
  # 		"name":"NewPost #N",
  # 		"text":"<p>This is my Nth post</p>",
  # 		"permalink":"new-post-N",
  # 		"image_id": 1,
  # 		"tags": [
  # 			{	"tag_name":"#M"	},
  # 			{ "tag_name":"wowow-post" },
  # 			{ "tag_name":"Yahooooewwa!" }
  # 		]
  # 	}
  # }
  def create
    @post = Post.new(post_params);
    
    begin
      @post.tags << parsed_tags
    rescue Exception => e
      logger.warn(e.message)
      # Should the errors be sent like this?
      # FIXME find out how they should look like
      rj( {message: e.message}, 500) # 500 stands for internal server error
      return
    end
    
    if @post.save
      render json: @post, include: 'tags'
    else
      rj @post.errors, 500
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.tags = []
    begin
      @post.tags << parsed_tags
    rescue Exception => e
      logger.warn(e.message)
      # Should the errors be sent like this?
      # FIXME find out how they should look like
      rj( {message: e.message}, 500) # 500 stands for internal server error
      return
    end

    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    logger.info('Post was deleted')
    rj nil, 204    
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:name, :text, :permalink, :image_id)
  end
  
  def parsed_tags
    tags = []
    param_tags = params[:post][:tags] || []
    
    param_tags.each do |tag|
      # FIXME: May cause an Exception if could not save!
      tags << find_or_add_tag(tag[:tag_name])
    end

    tags
  end

  def find_or_add_tag(tag_name)
    existing_tag = Tag.where(:tag_name => tag_name)
    
    if existing_tag.blank?
      t = Tag.new(:tag_name => tag_name)
      if t.save then
        return t
      else
        raise Exception.new("Couldn't save tag #{tagname} for unknown reasons. Tag not saving into database")
      end
    end
    existing_tag
  end
end
