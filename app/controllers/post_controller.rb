class PostController < ApplicationController

  def index
      render Post.all.to_json, status: "200 OK"
  end

  def show
  end
end
