require_relative './tag'
require_relative './post'

class PostRepository

  def find_by_tag(name)
    sql = 'SELECT posts.id AS posts_id, 
      posts.title AS posts_title
      FROM posts
      JOIN posts_tags ON posts_tags.post_id = posts.id
      JOIN tags ON posts_tags.tag_id = tags.id
      WHERE tags.name = $1;'

    params = [name]

    result_set = DatabaseConnection.exec_params(sql, params)
    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['posts_id']
      post.title = record['posts_title']
      
      posts << post
    end

    return posts
  end
  def find_by_post(id)
    sql = 'SELECT tags.id AS tags_id, tags.name AS tags_name
      FROM tags
      JOIN posts_tags ON posts_tags.tag_id = tags.id
      JOIN posts ON posts_tags.post_id = posts.id
      WHERE posts.id = $1;'

    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
    tags = []

    result_set.each do |record|
      tag = Tag.new
      tag.id = record['tags_id']
      tag.name = record['tags_name']

      tags << tag
    end
    return tags
  end

end


