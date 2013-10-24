require "date_parser"

class DaysController < ApplicationController
  before_filter :set_group
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to group_path(@group)
  end

  def index
    @day = Date.today
    @prev = @day.prev_day
    @next = @day.next_day
    @posts = @group.posts_for @day
    render "posts/index"
  end

  def show
    @day = date
    @prev = @day.prev_day
    @next = @day.next_day
    @posts = @group.posts_for @day
    render "posts/index"
  end

  protected

  def set_group
    @group = Group.find params[:group_id]
  end

  def date
    @date ||= DateParser.parse params[:id]
    raise ActiveRecord::RecordNotFound if @date.nil?
    @date
  end
end
