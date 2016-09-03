require "rails_helper"

RSpec.feature "User can edit an artist information" do
  scenario "able to update artist info" do

    artist = Artist.create(name: "Alec Tronic", image_path: "http://anotherwhiskyformisterbukowski.com/wp-content/uploads/2013/06/artworks-000049472137-fb15gh-t500x500.jpg")
    updated_name = "Alect Troniq"
    visit artist_path(artist)
    click_on "Edit Artist"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content artist[:name]
    expect(page).to have_xpath("//img[@src='#{artist[:image_path]}']")

  end
end
