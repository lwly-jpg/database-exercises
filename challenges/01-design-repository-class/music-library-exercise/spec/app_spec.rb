require_relative '../app.rb'

describe Application do

  it 'prints out welcome message and options' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Welcome to the music library manager!")
    expect(terminal).to receive(:puts).with("What would you like to do?")
    expect(terminal).to receive(:puts).with("1 - List all albums")
    expect(terminal).to receive(:puts).with("2 - List all artists")
    expect(terminal).to receive(:puts).with("Enter your choice:")
    expect(terminal).to receive(:gets).and_return("1")
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    music_library = Application.new('music_library_test', terminal, album_repository, artist_repository)
    music_library.run
  end

  it 'prints out albums when 1 is inputted' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Welcome to the music library manager!")
    expect(terminal).to receive(:puts).with("What would you like to do?")
    expect(terminal).to receive(:puts).with("1 - List all albums")
    expect(terminal).to receive(:puts).with("2 - List all artists")
    expect(terminal).to receive(:puts).with("Enter your choice:")
    expect(terminal).to receive(:gets).and_return("1")
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    music_library = Application.new('music_library_test', terminal, album_repository, artist_repository)
    music_library.run
  end

end