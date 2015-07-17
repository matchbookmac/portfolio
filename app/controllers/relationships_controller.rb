class RelationshipsController < AdminController
  before_action :set_user, only: [:show, :destroy]

  before_filter :ensure_admin!, except: [:index, :show]

  def index
    @relationships = Relationship.all
  end

  def show
  end

  def new
    @reference = Relationship.new
  end

  def create
    @reference = Relationship.new(relationship_params)

    respond_to do |format|
      if @reference.save
        flash[:notice] = 'Reference was successfully created.'
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path, notice: "Please try again" }
        format.js
      end
    end
  end

  def destroy
    # @user.destroy
    # flash[:alert] = "We are sorry to see you go :("
    # redirect_to users_path
  end

private

  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:relationship, :user_id, :reference_id)
  end
end
