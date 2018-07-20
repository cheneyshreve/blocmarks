class TopicsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index

  def index
    @topics = Topic.all
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = User.find_by(params[:email]) || current_user
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully!"
    else
      flash.now[:alert] = "Error creating topic, please try again."
      render topics_path
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

def destroy
  @topic = Topic.find(params[:id])
  authorize @topic

  if @topic.destroy
    flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
    if !@bookmarks.nil?
      redirect_to @bookmarks
    else
      redirect_to @bookmarks
    end
  else
    flash.now[:alert] = "There was an error deleting the topic."
    render :show
  end
end

private
def topic_params
  params.require(:topic).permit(:title,:user, :user_id)
end

end
