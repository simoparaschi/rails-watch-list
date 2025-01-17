class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(form_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @id = params[:id]
    @bookmark = Bookmark.find(@id)
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def find_list
    @list_id = params[:list_id]
    @list = List.find(@list_id)
  end

  def form_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
