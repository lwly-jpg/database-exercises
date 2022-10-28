require_relative '../app.rb'

def reset_artist_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

def reset_album_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_artist_table
    reset_album_table
  end

  it 'prints out albums when 1 is inputted' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(terminal).to receive(:puts).with("What would you like to do?").ordered
    expect(terminal).to receive(:puts).with("1 - List all albums").ordered
    expect(terminal).to receive(:puts).with("2 - List all artists").ordered
    expect(terminal).to receive(:puts).with("Enter your choice:").ordered
    expect(terminal).to receive(:gets).and_return("1")
    expect(terminal).to receive(:puts).with("1 - Is This It - 2001").ordered
    expect(terminal).to receive(:puts).with("2 - Nevermind - 1991").ordered
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    music_library = Application.new('music_library_test', terminal, album_repository, artist_repository)
    music_library.run
  end

  it 'prints out artists when 2 is inputted' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Welcome to the music library manager!")
    expect(terminal).to receive(:puts).with("What would you like to do?")
    expect(terminal).to receive(:puts).with("1 - List all albums")
    expect(terminal).to receive(:puts).with("2 - List all artists")
    expect(terminal).to receive(:puts).with("Enter your choice:")
    expect(terminal).to receive(:gets).and_return("2")
    expect(terminal).to receive(:puts).with("1 - Spice Girls - Pop")
    expect(terminal).to receive(:puts).with("2 - 50 Cent - Rap")
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    music_library = Application.new('music_library_test', terminal, album_repository, artist_repository)
    music_library.run
  end

  it 'prints out invalid input when 3 is inputted' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Welcome to the music library manager!")
    expect(terminal).to receive(:puts).with("What would you like to do?")
    expect(terminal).to receive(:puts).with("1 - List all albums")
    expect(terminal).to receive(:puts).with("2 - List all artists")
    expect(terminal).to receive(:puts).with("Enter your choice:")
    expect(terminal).to receive(:gets).and_return("3")
    expect(terminal).to receive(:puts).with("Invalid input.")
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    music_library = Application.new('music_library_test', terminal, album_repository, artist_repository)
    music_library.run
  end

end