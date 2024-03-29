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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.new
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @wallpaper = "#{@list.poster_url.strip}"
    @mainTitle = @list.name
    @filter =" filter:grayscale(1)"
    @reviews = Review.where(list: params[:id] );


    puts"------------------------"
    puts @reviews
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
     end
  end

  private

  def list_params
    params.require(:list).permit(:name, :poster_url)
  end
end
