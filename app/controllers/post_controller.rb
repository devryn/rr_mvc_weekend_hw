class PostController < ApplicationController

  def index
    render Post.all.to_json, status: "200 OK"
  end

  def show
    post = Post.all.find(params[:id]) { |p| (1..Post.all.count).include?(p.id) }
    if post
      render(post.to_json, status: "200 OK")
    else
      render({ message: "Post not found" }, status: "404 NOT FOUND")
    end
  end
end
