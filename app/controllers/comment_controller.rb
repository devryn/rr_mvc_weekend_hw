class CommentController < ApplicationController

  def index
    render Comment.all.to_json, status: "200 OK"
  end

  def show
    comment = Comment.all.find(params[:id]) { |c| (1..Comment.all.count).include?(c.id) }
    if comment
      render(comment.to_json, status: "200 OK")
    else
      render({ message: "Comment not found" }, status: "404 NOT FOUND")
    end
  end

  def show_comments
    post_comments = Comment.all.select { |c| c.post_id == params[:id].to_i}

    render(post_comments.to_json)
  end

  def create
    Comment.new(params["message"], params["author"], params["post_id"].to_i)

    redirect_to "/posts/#{params["post_id"]}"
  end
end
