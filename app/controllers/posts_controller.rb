class PostsController < ApplicationController
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: "投稿されました"
      else
        render 'new'
      end
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
        flash[:success]= "投稿を削除しました"
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
           flash[:success]= "投稿を変更しました"
           redirect_to posts_path
        else
          flash[:success] = "投稿に失敗しました"
          render "edit",status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.require(:post).permit(:title,:content)
    end

end
