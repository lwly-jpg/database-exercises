require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'returns a list of all users' do

    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 2
    expect(users[0].id).to eq "1"
    expect(users[0].username).to eq 'toad'
    expect(users[0].email).to eq 'toad@fake.com'
    expect(users[1].id).to eq "2"
    expect(users[1].username).to eq 'chicken'
    expect(users[1].email).to eq 'chicken@fake.com'

  end

  it 'returns a the first user' do
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.id).to eq "1"
    expect(user.username).to eq 'toad'
    expect(user.email).to eq 'toad@fake.com'
  end

  it 'returns a the second user' do
    repo = UserRepository.new
    user = repo.find(2)
    expect(user.id).to eq "2"
    expect(user.username).to eq 'chicken'
    expect(user.email).to eq 'chicken@fake.com'
  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.username = 'bob'
    new_user.email = 'bob@fake.com'
    
    repo.create(new_user)
    users = repo.all
    last_user = users.last
    expect(users.length).to eq 3
    expect(last_user.username).to eq 'bob'
    expect(last_user.email).to eq 'bob@fake.com'
  end

  it 'deletes a single user' do
    repo = UserRepository.new
    repo.delete(1)
    all_users = repo.all
    expect(all_users.length).to eq 1
    expect(all_users.first.id).to eq '2'
    expect(all_users.first.username).to eq 'chicken'
    expect(all_users.first.email).to eq 'chicken@fake.com'
  end

  it 'deletes all users' do
    repo = UserRepository.new
    repo.delete(1)
    repo.delete(2)
    all_users = repo.all
    expect(all_users.length).to eq 0
  end

  it 'updates a user' do
    repo = UserRepository.new
    user = repo.find(1)
    user.username = 'frog'
    repo.update(user)

    updated_user = repo.find(1)

    expect(updated_user.username).to eq 'frog'
    expect(updated_user.email).to eq 'toad@fake.com'
  end

  
end