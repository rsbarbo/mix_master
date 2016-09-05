class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist)
    else
      render :new
    end
  end

  def show
    current_playlist
  end

  def edit
    current_playlist
    @songs = Song.all
  end

  def update
    current_playlist
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist)
    else
      render :edit
    end
  end

  private

  def current_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
