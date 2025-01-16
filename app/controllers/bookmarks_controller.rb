class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list_id = params[:list_id]
    @list = List.find(@list_id)
  end

  def create
    # @list_id = params[:id]
    # @list = List.find(@list_id)
    # @bookmark = Bookmark.new(...)
  end

  def destroy
    @id = params[:id]
    @bookmark = Bookmark.find(@id)
    @bookmark.destroy
  end
end
