class BookmarksController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to @topic
    else
      flash[:alert] = "There was a problem saving the bookmark, please try again."
      render :new
    end

  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving bookmark. Please try again."
      render :edit
    end
  end

def destroy
  @bookmark = Bookmark.find(params[:id])
  authorize @bookmark

  if @bookmark.destroy
    flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
    redirect_to topics_path
  else
    flash.now[:alert] = "There was an error deleting the bookmark."
    render :show
  end
end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
