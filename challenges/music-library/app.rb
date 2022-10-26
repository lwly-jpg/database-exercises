require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

class Application
  def initialize(database_name, terminal, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @terminal = terminal
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @terminal.puts "Welcome to the music library manager!"
    @terminal.puts "What would you like to do?"
    @terminal.puts "1 - List all albums"
    @terminal.puts "2 - List all artists"
    @terminal.puts "Enter your choice:"
    input = @terminal.gets.chomp

    if input == "1"
      list_albums
    elsif input == "2"
      list_artists
    else
      @terminal.puts "Invalid input."
    end 

  end

  private

  def list_albums
    result = DatabaseConnection.exec_params('SELECT id, title, release_year FROM albums;', [])
    result.each do |record|
      @terminal.puts record.values.join(" - ")
    end
  end

  def list_artists
    result = DatabaseConnection.exec_params('SELECT id, name, genre FROM artists;', [])
    result.each do |record|
      @terminal.puts record.values.join(" - ")
    end
  end

end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end