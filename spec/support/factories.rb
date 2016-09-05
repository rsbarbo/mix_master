FactoryGirl.define do

  factory :artist do
    name
    image_path  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end

  # will randomize the playlist names.
  sequence :playlist_name do |n|
    "#{n}"
  end

  # will create a playlist with names in it.
  factory :playlist do
    name { generate(:playlist_name) }

    # will create a playlist with 3 songs in it.
    factory :playlist_with_songs do
      songs { create_list(:song, 3)}
    end
  end

end
