require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it 'returns a list of posts' do
    repo = PostRepository.new
    posts = repo.all

    expect(posts.length).to eq 2
    expect(posts[0].id).to eq "1"
    expect(posts[0].title).to eq 'my day'
    expect(posts[0].content).to eq 'it was great but busy'
    expect(posts[0].views).to eq '50'
    expect(posts[1].id).to eq "2"
    expect(posts[1].title).to eq 'my life'
    expect(posts[1].content).to eq 'is amazing'
    expect(posts[1].views).to eq '30'
  end

  it 'finds the first post' do
    repo = PostRepository.new

    post = repo.find(1)

    expect(post.id).to eq "1"
    expect(post.title).to eq 'my day'
    expect(post.content).to eq 'it was great but busy'
    expect(post.views).to eq '50'
  end

  it 'finds the second post' do
    repo = PostRepository.new

    post = repo.find(2)

    expect(post.id).to eq "2"
    expect(post.title).to eq 'my life'
    expect(post.content).to eq 'is amazing'
    expect(post.views).to eq '30'
  end

  it 'creates a new post' do
    repo = PostRepository.new

    new_post = Post.new
    new_post.title = 'hello'
    new_post.content = 'world'
    new_post.views = '1000'

    repo.create(new_post)
    posts = repo.all
    last_post = posts.last
    expect(posts.length).to eq 3
    expect(last_post.title).to eq 'hello'
    expect(last_post.content).to eq 'world'
    expect(last_post.views).to eq '1000'
  end

  it 'deletes a post' do
    repo = PostRepository.new
    repo.delete(1)
    all_posts = repo.all
    expect(all_posts.length).to eq 1
    expect(all_posts.first.id).to eq '2'
    expect(all_posts.first.title).to eq 'my life'
    expect(all_posts.first.content).to eq 'is amazing'
    expect(all_posts.first.views).to eq '30'
  end
end