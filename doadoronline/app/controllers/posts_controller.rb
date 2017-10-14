class PostsController < ApplicationController
  #authorize_resource class: :posts
  before_action :set_post, only: [:destroy, :update, :edit ]

  def new
    @post = Post.new
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post foi Atualizado com sucesso"
    else
      render :edit
    end
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post cadastrado com sucesso!"
    else
      render :new
    end
  end

  def destroy
    respond_to do |format|
      begin
        @post.delete
        format.html { redirect_to posts_path, notice: "Post removido com sucesso" }
        format.js
      rescue
        format.html { redirect_to posts_path, notice: "Post não pode ser removido" }
        format.js
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:titulo, :descricao)
  end

end
