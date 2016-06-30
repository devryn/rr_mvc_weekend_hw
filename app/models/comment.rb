require 'faker'
class Comment
  @@all = []
  attr_reader :id, :post_id
  attr_accessor :message, :author

  def initialize(message, author, post_id)
    @@all << self
    @id = set_id
    @message = message
    @author = author
    @post_id = post_id
  end

  def to_json(json_arg = nil)
    {
      id: @id,
      message: @message,
      author: @author,
      post_id: @post_id
    }.to_json
  end

  def Comment.all
    @@all
  end

  private

  def set_id
    $comment_id ||= 0
    $comment_id += 1
  end
end
