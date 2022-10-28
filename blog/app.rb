require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

class Application
  def initialize(database_name)
    DatabaseConnection.connect(database_name)
    @post = PostRepository.new
  end

  def lookup_comments(post_id)
    result_set = @post.find_with_comments(post_id)
    puts "Post title: #{result_set.title}"
    puts "Post content: #{result_set.content}" 
    puts "#{result_set.comments.length} comments:"
    result_set.comments.each do |comment|
      puts "* #{comment.author}: '#{comment.content}'"
   end
  end
end

if __FILE__ == $0
  app = Application.new(
    'blog'
  )
  app.lookup_comments('1')
end