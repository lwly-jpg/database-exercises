require_relative '../lib/post_repository'

def reset_blog_table
  seed_sql = File.read('spec/blog_posts_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_2' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_blog_table
  end

  it 'returns list of posts tagged coding' do
    repo = PostRepository.new
    posts = repo.find_by_tag('coding')
    expect(posts.length).to eq 4
    expect(posts[0].title).to eq 'How to use Git'
    expect(posts[1].id).to eq '2'
  end
  
  it 'returns list of tags associated with post with id 1' do
    repo = PostRepository.new
    tags = repo.find_by_post('2')
    expect(tags.length).to eq 2
    expect(tags[0].name).to eq 'coding'
    expect(tags[1].name).to eq 'ruby'
    expect(tags[0].id).to eq '1'
    expect(tags[1].id).to eq '4'
  end

end

# .{"tags_id"=>"1", "tags_name"=>"coding"}
# {"tags_id"=>"4", "tags_name"=>"ruby"}