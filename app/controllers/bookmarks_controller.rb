class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def create
    @resource = Resource.find(params[:id])
    @bookmark = Bookmark.new(resource: @resource, user: current_user)
    if @bookmark.save
      redirect_to @resource, notice: 'This resource has been added to your bookmarks.'
    else
      redirect_to @resource, alert: 'This resource could not be added to your bookmarks.'
    end
  end

  def index
    @bookmarks = current_user.bookmarks.includes(:resource)
  end

  def destroy
    @resource = @bookmark.resource
    @bookmark.destroy
    redirect_to @resource, notice: 'This resource has been removed from your bookmarks.'
  end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
end
