require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

artist_repository.all.each do |artist|
  p artist
end

album_repository.all.each do |album|
  p album
end

album = album_repository.find(1)
puts album.title