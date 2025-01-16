class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    # @list_id = params[:id]
    # @list = List.find(@list_id)
    @bookmark = Bookmark.new(form_params)
  end

  def destroy
    @id = params[:id]
    @bookmark = Bookmark.find(@id)
    @bookmark.destroy
  end

  private

  def form_params
    params.require(:bookmark).permit(:comment)
  end
end
