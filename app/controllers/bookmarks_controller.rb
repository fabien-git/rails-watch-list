class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
      @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = set_list
    if @bookmark.save
      redirect_to list_path(set_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

    @bookmark = Bookmark.find(params[:id])
    puts"-----------------------------"
    @list = @bookmark.list
    if @bookmark.destroy
        redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
