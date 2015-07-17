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
    if current_user.admin?
      @post = Post.new
    else
      redirect_to root_path, alert: "You do not have the permissions to perform that action"
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.comment
      respond_to do |format|
        if @post.save
# binding.pry
          flash[:notice] = 'Comment was successfully created.'
          format.html { redirect_to post_path(@post.post) }
          format.js
        else
          @comment = @post
          @post = @comment.post
          format.html { render :show }
          format.js
        end
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
    if @post.comment
      @comment = @post
      @post = @comment.post
      @comment.destroy
      flash[:notice] = 'Post was successfully destroyed.'
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    elsif current_user.admin?
      @post.destroy
      flash[:notice] = 'Post was successfully destroyed.'
      redirect_to posts_url
    end
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
