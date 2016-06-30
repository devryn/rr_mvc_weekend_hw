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
end
