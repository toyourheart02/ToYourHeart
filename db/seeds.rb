# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

# artistの登録
CSV.foreach('db/artists.csv') do |info|
  Artist.create(:artist_name => info[0], :artist_kana => info[1])
end

# genreの登録
CSV.foreach('db/genres.csv') do |info|
  Genre.create(:genre_name => info[0])
end

# labelの登録
CSV.foreach('db/labels.csv') do |info|
  Label.create(:label_name => info[0])
end

# sceneの登録
CSV.foreach('db/scenes.csv') do |info|
  Scene.create(:scene_name => info[0])
end

# musicの登録
CSV.foreach('db/musics.csv') do |info|
  Music.create(:music_name => info[0], :music_kana => info[1], :artist_id => info[2])
end


# Productの登録
CSV.foreach('db/products.csv') do |info|
  Product.create(:title => info[0], :kana => info[1], :price => info[2], :release_date => info[3],
   :scene_id => info[4], :genre_id => info[5], :label_id => info[6], :stock => info[7], :artist_id => info[8])
end
