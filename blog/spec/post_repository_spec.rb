require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
  connection.exec(seed_sql)
end

def reset_comments_table
  seed_sql = File.read('spec/seeds_comments.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
    reset_comments_table
  end

  it 'finds post 1 with related comments' do
    repo = PostRepository.new
    post = repo.find_with_comments(1)
    expect(post.title).to eq 'my day'
    expect(post.content).to eq 'it was great but busy'
    expect(post.comments.length).to eq 2
    expect(post.comments[0].author).to eq 'toad'
    expect(post.comments[1].content).to eq 'i love chicken'
  end


end