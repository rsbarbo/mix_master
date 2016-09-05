class SongsController < ApplicationController

  def new
    artist_id
    @song = @artist.songs.new
  end

  def create
    artist_id
    @song = @artist.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def artist_id
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end

end
