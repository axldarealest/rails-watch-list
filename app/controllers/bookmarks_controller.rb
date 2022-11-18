class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_bookmark, only: %i[destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark.movie = @movie

    if @bookmark.save!
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
