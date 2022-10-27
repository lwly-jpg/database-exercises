require_relative 'post'
require_relative 'comment'


class PostRepository

  def find_with_comments(id)

    sql = 'SELECT posts.id AS post_id, 
          posts.title, 
          posts.content AS post_content, 
          comments.id AS comment_id, 
          comments.content AS comment_content, 
          comments.author 
          FROM posts
          JOIN comments ON comments.post_id = posts.id
          WHERE posts.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    post = Post.new
    post.id = result.first['post_id']
    post.title = result.first['title']
    post.content = result.first['post_content']

    result.each do |record|
      comment = Comment.new
      comment.id = record['comment_id']
      comment.content = record['comment_content']
      comment.author = record['author']

      post.comments << comment
    end
    return post
    
  end
end