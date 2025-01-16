class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @id = params[:id]
    @list = List.find(@id)
    @movies = @list.movies
  end

  def new
  @list = List.new
  end

  def create
    @list = List.new(form_params)
    @list.save
    redirect_to lists_path
  end

  private

  def form_params
    params.require(:list).permit(:name)
  end
end
