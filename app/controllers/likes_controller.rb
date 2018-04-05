class LikesController < ApplicationController

  after_action :verify_authorized
  
  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
       flash[:notice] = "Your like has been saved."
       redirect_to @bookmark
    else
       flash[:alert] = "There was a problem saving your like, please try agian."
       redirect_to @bookmark
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
       flash[:notice] = "Your like was successfully destroyed."
       redirect_to @bookmark
    else
       flash[:alert] = "There was a problem unliking your like, please try again."
       redirect_to @bookmark
    end
  end
end
