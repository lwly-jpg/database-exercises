class Post
  attr_accessor :id, :title, :tags

  def initialize
    @tags = []
  end
end

# {"posts_id"=>"1", "posts_title"=>"How to use Git"}
# {"posts_id"=>"2", "posts_title"=>"Ruby classes"}
# {"posts_id"=>"3", "posts_title"=>"Using IRB"}
# {"posts_id"=>"7", "posts_title"=>"SQL basics"}

# {"posts_id"=>"1", "posts_title"=>"How to use Git"}
# {"posts_id"=>"2", "posts_title"=>"Ruby classes"}
# {"posts_id"=>"3", "posts_title"=>"Using IRB"}
# {"posts_id"=>"4", "posts_title"=>"My weekend in Edinburgh"}
# {"posts_id"=>"5", "posts_title"=>"The best chocolate cake EVER"}
# {"posts_id"=>"6", "posts_title"=>"A foodie week in Spain"}
# {"posts_id"=>"7", "posts_title"=>"SQL basics"}
# {"posts_id"=>"6", "posts_title"=>"A foodie week in Spain"}
# {"posts_id"=>"2", "posts_title"=>"Ruby classes"}
# {"posts_id"=>"3", "posts_title"=>"Using IRB"}
# {"posts_id"=>"7", "posts_title"=>"SQL basics"}