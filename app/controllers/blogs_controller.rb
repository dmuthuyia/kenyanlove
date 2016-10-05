class BlogsController < ApplicationController
before_action :find_blog, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
before_action :authenticate_user!, except: [:index, :show]

def index
	
		@blogs = Blog.all.order("created_at DESC")
end

def show
	#@comments = Comment.where(blog_id: @blog)
	#@random_blog = blog.where.not(id: @blog).order("RANDOM()").first
end

def new
	@blog = current_user.blogs.build
end

def create
	@blog = current_user.blogs.build(blog_params)

	if @blog.save
		BlogArticleMailer.blog_article_created(current_user, @blog, @blog.title, @blog.created_at).deliver
		redirect_to @blog
	else
		render 'new'
	end
end

def edit
end

def update
	if @blog.update(blog_params)
		redirect_to @blog
	else
		render 'edit'
	end
end

def destroy
	@blog.destroy
	redirect_to root_path
end

def upvote
	@blog.upvote_by current_user
	redirect_to :back
end

def downvote
	@blog.downvote_by current_user
	redirect_to :back
end

private

def find_blog
	@blog = Blog.find(params[:id])
end

def blog_params
	params.require(:blog).permit(:title, :body, :blog_img, :url)
end

end

