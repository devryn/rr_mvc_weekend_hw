class PostController < ApplicationController

  def index
    render Post.all.to_json, status: "200 OK"
  end

  def show
    index = params[:id].to_i - 1
    post = Post.all[index]

    if post_exists?
      render(post.to_json, status: "200 OK")
    else
      render({ message: "Post not found" }, status: "404 NOT FOUND")
    end
  end

  def create
    post = Post.new(params["title"], params["author"], params["body"])
    

    redirect_to "/posts/#{post.id}"
  end

private
  def post_exists?
    (1..Post.all.count).include?(params[:id].to_i)
  end

end
