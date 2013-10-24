require "date_parser"

class CommentsController < ApplicationController
  before_action :set_group_and_day_and_post_and_comments

  # GET /comments/new
  def new
    @comment = @comments.new
  end

  # POST /comments
  def create
    @comment = @group.add_comment current_user, @post, comment_params[:body]

    if @comment.valid?
      redirect_to group_day_post_url(@group, @day, @post), notice: "Comment was successfully created."
    else
      render action: "new"
    end
  end

  private

  def set_group_and_day_and_post_and_comments
    @group = Group.find params[:group_id]
    @day = DateParser.parse params[:day_id]
    raise ActiveRecord::RecordNotFound if @day.nil?
    @post = @group.posts_for(@day).find params[:post_id]
    @comments = @post.comments
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params[:comment]
  end
end
