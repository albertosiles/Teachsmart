class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:destroy]

  def create
    @resource = Resource.find(params[:id])
    @bookmark = current_user.bookmarks.find_by(resource: @resource)

    if @bookmark
      redirect_to bookmarks_path, alert: 'This resource is already on your bookmark list.'
    else
      @bookmark = Bookmark.new(resource: @resource, user: current_user)
      if @bookmark.save
        redirect_to bookmarks_path, notice: 'This resource has been added to your bookmarks.'
      else
        redirect_to @resource, alert: 'Failed to add this resource to your bookmarks.'
      end
    end
  end

  def index
    @bookmarks = current_user.bookmarks.includes(:resource)
  end

  def destroy
    @resource = @bookmark.resource
    @bookmark.destroy
    redirect_to bookmarks_path, notice: 'This resource has been removed from your bookmarks.'
  end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bookmarks_path, alert: 'Bookmark not found.'
  end
end
