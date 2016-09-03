

RSpec.feature "User deletes an artist" do
  scenario "user can delete unwanted artist" do

    artist_1 = Artist.create(name: "BOB MARLEY", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_2 = Artist.create(name: "LCD SOUNDSYSTEM", image_path: "http://www.covermesongs.com/wp-content/uploads/2012/01/ESGWhatSheCameFor-500x337.jpg")

    visit artist_path(artist_1)
    expect(page).to have_content artist_1[:name]
    expect(page).to have_content "Delete Artist"

    click_on "Delete Artist"

    expect(current_path).to eq artists_path

    expect(page).to have_content artist_2[:name]
    expect(page).to_not have_content artist_1[:name]

  end
end
