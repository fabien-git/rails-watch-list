class ListsController < ApplicationController
  def index
    @lists = List.all
    @wallpaper = "cinema.jpg"
    @mainTitle = "Save any kind of movies"
    @filter =" filter:none"
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @wallpaper = "#{@list.poster_url.strip}"
    @mainTitle = @list.name
    @filter =" filter:grayscale(1)"
  end

  private

  def list_params
    params.require(:list).permit(:name, :poster_url)
  end
end
