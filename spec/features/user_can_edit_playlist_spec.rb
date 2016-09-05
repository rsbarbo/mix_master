require "rails_helper"

RSpec.feature "User can edit a specific playlist" do
  scenario "user is able to change a given playlist" do

    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "My new Test song")

    visit playlist_path(playlist)
    click_on "Edit Playlist"
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"
  end
end
