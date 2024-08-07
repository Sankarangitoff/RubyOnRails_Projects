class BlogPostsController < ApplicationController
#   before_action :authenticate_user!, only: [:create, :edit, :destroy, :update]

    # before_action :set_blog_post, expect: [:index, :new, :create]
        # #           we can also write as only: [:show, :edit, :destroy, :update]
    def index
        @blog_posts = BlogPost.all
    end

    def show
            @blog_post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
            @blog_post = BlogPost.new
    end

    def create
            @blog_post = BlogPost.new(blog_post_params)
            if @blog_post.save
                redirect_to @blog_post
            else
              render :new, status: :unprocessable_entity
            end
    end

    def edit
            @blog_post = BlogPost.find(params[:id])
    end

    def update
            @blog_post = BlogPost.find(params[:id])
            if @blog_post.update(blog_post_params)
                redirect_to @blog_post
            else
              render :edit, status: :unprocessable_entity
            end
    end

     def destroy
                @blog_post = BlogPost.find(params[:id])
                @blog_post.destroy
                redirect_to blog_posts_path
    end

    private

    def blog_post_params
            params.require(:blog_post).permit(:title, :body)
    end

    # def set_blog_post
        # @blog_post = BlogPost.find_by(params[:id])
    #     # rescue ActiveRecord::RecordNotFound
    #     #         redirect_to root_path

    # end
end