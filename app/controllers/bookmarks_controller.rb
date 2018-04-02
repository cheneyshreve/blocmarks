class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(bookmark_params)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to @topic
    else
      flash[:alert] = "There was a problem saving the bookmark, please try again."
      render :new
    end

  end

  def edit
  end

  def destroy
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
