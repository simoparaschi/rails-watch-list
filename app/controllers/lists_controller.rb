class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @id = params[:id]
    @list = List.find(@id)
    @movies = @list.movies
    @bookmarks = @list.bookmarks
  end

  def new
  @list = List.new
  end

  def create
    @list = List.new(form_params)
    if @list.save
      redirect_to lists_path, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:list).permit(:name, :photo)
  end
end
