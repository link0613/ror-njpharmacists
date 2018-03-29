class BlogPostsController < ApplicationController
  
  # GET /blog_posts
  # GET /blog_posts.json
  def index
    if(post_params[:blog_id].nil?)
      @blog = Blog.where(blog_url_alias: post_params[:blog_url_alias]).first
    else
      @blog = Blog.find(post_params[:blog_id])
    end
    @blog_posts = @blog.blog_posts.where("DATE(created_at) <= DATE(?)", Time.now)
    @is_blog = true

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_posts }
    end
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
    if(post_params[:id].nil?)
      @blog_post = BlogPost.where(post_url_alias:post_params[:post_url_alias]).first
    else
      @blog_post = BlogPost.find(post_params[:id])
    end
    
    @blog = @blog_post.blog
    @is_blog = true

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog_posts/new
  # GET /blog_posts/new.json
  def new
    @blog_post = BlogPost.new
    
    @blog = Blog.find(post_params[:blog_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog_posts/1/edit
  def edit
    @blog_post = BlogPost.find(post_params[:id])
    @blog = @blog_post.blog
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(post_params)
    
    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post.blog, notice: 'Blog post was successfully created.' }
        format.json { render json: @blog_post, status: :created, location: @blog_post }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_posts/1
  # PUT /blog_posts/1.json
  def update
    @blog_post = BlogPost.find(params[:id])

    respond_to do |format|
      if @blog_post.update_attributes(post_params)
        format.html { redirect_to blog_path(@blog_post.blog), notice: 'Blog post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog = @blog_post.blog
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_blog_posts_url(@blog) }
      format.json { head :no_content }
    end
  end

  private
  def post_params
    if(@_action_name != 'update' && @_action_name != 'create')
      params
    else
      params.require(:blog_post).permit(:post_content, :post_subtitle, :post_title, :post_url_alias, :featured_image, :featured_image_file_name, :blog_id, :created_at)
    end
  end

end
