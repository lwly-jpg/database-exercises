require_relative '../lib/album_repository'

def reset_album_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe 'AlbumRepository' do
  before(:each) do 
    reset_album_table
  end

  it 'prints out the list of albums to the terminal' do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq 2
    expect(albums.first.id).to eq '1'
    expect(albums.first.title).to eq 'Is This It'
    expect(albums.first.release_year).to eq '2001'
    expect(albums.first.artist_id).to eq '13'
  end

  it 'prints out single album to the terminal' do
    repo = AlbumRepository.new
    album = repo.find(2)
    expect(album.title).to eq 'Nevermind'
    expect(album.release_year).to eq "1991"
    expect(album.artist_id).to eq "14"
  end
end