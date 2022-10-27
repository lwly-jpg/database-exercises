require_relative '../lib/artist_repository'

def reset_artist_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artist_table
  end

  it 'prints out the list of albums to the terminal' do
    repo = ArtistRepository.new
    artists = repo.all
    expect(artists.length).to eq 2
    expect(artists.first.id).to eq '1'
    expect(artists.first.name).to eq 'Spice Girls'
    expect(artists.first.genre).to eq 'Pop'
  end

  it 'prints out single artist to the terminal' do
    repo = ArtistRepository.new
    artist = repo.find(2)
    expect(artist.name).to eq '50 Cent'
    expect(artist.genre).to eq "Rap"
  end

  it 'creates a new artist' do 
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.name = 'System of a Down'
    new_artist.genre = 'Heavy Metal'
    repo.create(new_artist)
    artists = repo.all
    last_artist = artists.last
    expect(last_artist.name).to eq ('System of a Down')
    expect(last_artist.genre).to eq ('Heavy Metal')
  end


  it 'updates an artist with new values' do
    repo = ArtistRepository.new

    artist = repo.find(1)

    artist.name = 'Something else'
    artist.genre = 'Disco'

    repo.update(artist)

    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq 'Something else'
    expect(updated_artist.genre).to eq 'Disco'
  end
end