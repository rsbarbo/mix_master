

RSpec.feature "User sees all artists when visiting page" do
  scenario "they see the page for all artists" do

    artist_1 = Artist.create(name: "BOB MARLEY", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_2 = Artist.create(name: "LCD SOUNDSYSTEM", image_path: "http://www.covermesongs.com/wp-content/uploads/2012/01/ESGWhatSheCameFor-500x337.jpg")

    visit artists_path

    expect(page).to have_content(artist_1[:name])
    expect(page).to have_xpath("//img[@src='#{artist_2[:image_path]}']")


    expect(page).to have_content(artist_2[:name])
    expect(page).to have_xpath("//img[@src='#{artist_1[:image_path]}']")

  end
end
