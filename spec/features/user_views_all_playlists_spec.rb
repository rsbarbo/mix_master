require "rails_helper"

RSpec.feature "User is able to see all the playlists" do
  scenario "they can see all the playlists" do

    playlist_1 = create(:playlist_with_songs)
    first, second, third = playlist_1.songs

    playlist_2 = create(:playlist_with_songs)
    first, second, third = playlist_2.songs

    visit playlists_path

    expect(page).to have_content playlist_1.name
    expect(page).to have_content playlist_2.name
  end
end
