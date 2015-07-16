class PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @comment = Post.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.comment
      if @post.save
        flash[:notice] = 'Comment was successfully created.'
        respond_to do |format|
          format.html { redirect_to post_path(@post.post) }
          format.js
        end
      else
        flash[:alert] = 'Please try again.'
        redirect_to post_path @post.post
      end
    elsif current_user.admin?
      if @post.save
        flash[:notice] = 'post was successfully created.'
        redirect_to @post
      else
        render :new
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    flash[:notice] = 'Post was successfully destroyed.'
    redirect_to posts_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content, :user_id, :post_id, :comment, :title)
    end
end
