require "date_parser"

class PostsController < ApplicationController
  before_action :set_group_and_day_and_posts
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /groups/:group_id/days/:day/posts
  def index
    @prev = @day.prev_day
    @next = @day.next_day
  end

  # GET /groups/:group_id/days/:day/posts/1
  def show
  end

  # GET /groups/:group_id/days/:day/posts/new
  def new
    @post = @posts.new
  end

  # GET /groups/:group_id/days/:day/posts/1/edit
  def edit
  end

  # POST /groups/:group_id/days/:day/posts
  def create
    @post = @group.add_post current_user, @day, post_params[:body]

    if @post.valid?
      redirect_to group_day_post_url(@group, @day, @post), notice: "Post was successfully created."
    else
      render action: "new"
    end
  end

  # PATCH/PUT /groups/:group_id/days/:day/posts/1
  def update
    if @post.update(post_params)
      redirect_to group_day_post_url(@group, @day, @post), notice: "Post was successfully updated."
    else
      render action: "edit"
    end
  end

  # DELETE /groups/:group_id/days/:day/posts/1
  def destroy
    @post.destroy
    redirect_to group_day_posts_url(@group, @day)
  end

  private

  def set_group_and_day_and_posts
    @group = Group.find params[:group_id]
    @day = DateParser.parse params[:day_id]
    raise ActiveRecord::RecordNotFound if @day.nil?
    @posts = @group.posts_for(@day)
  end

  def set_post
    @post = @posts.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params[:post]
  end
end
