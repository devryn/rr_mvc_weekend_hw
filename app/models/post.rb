require 'faker'
class Post
  @@all = []
  attr_reader :id
  attr_accessor :title, :author, :body, :published

  def initialize(title, author, body, published)
    @@all << self
    @id = set_id
    @title = title
    @author = author
    @body = body
    @published = published
  end

  def to_json(json_arg = nil)
    {
      id: @id,
      title: @title,
      author: @author,
      body: @body,
      published: @published,
      comments: comments
    }.to_json
  end

  def comments
    Comment.all.select { |c| c.post_id == id }
  end

  def Post.all
    @@all
  end

  private

  def set_id
    $post_id ||= 0
    $post_id += 1
  end
end
