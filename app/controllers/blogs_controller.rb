class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def create
  	blog = Blog.new(blog_params)
  	if blog.save
  		redirect_to "/"
  	else
  		render "/new"
  	end
  end

  def show
    @blog = Blog.find(params[:id])
  end


  def edit
    @blog = Blog.find(params[:id])
  end

# right now I have customized my update action;
# I need a hidden field to pass the blog id since I am losing it;
# if I use the default url for update blog:
# patch "blogs/:id" => "blogs#update"
# and I don't need customized action in the form:
# :url => '/whatever'

  def update
    blog_id = params[:blog_id]
    @blog = Blog.find(blog_id)
    if @blog.update(blog_params)
      redirect_to "/"
    else
      render "/blogs/#{blog_id}/edit"
    end
  end

def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy
end



  private

  def blog_params
  	params.require(:blog).permit(:title, :content)
  end


end
