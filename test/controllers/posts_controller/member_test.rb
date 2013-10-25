require 'test_helper'

describe PostsController, :member do
  before do
    # User is Member, but has no posts for the day
    login_with users(:mike)
    @group = groups :payroll
    @day = Date.today
    @post = posts :payroll_carl_today
  end

  it "should get index" do
    get :index, group_id: @group, day_id: @day
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  it "should get new" do
    get :new, group_id: @group, day_id: @day
    assert_response :success
  end

  it "should create post" do
    assert_difference('Post.count') do
      post :create, group_id: @group, day_id: @day, post: {  }
    end

    assert_redirected_to group_day_post_path(@group, @day, assigns(:post))
  end

  it "should show post" do
    get :show, group_id: @group, day_id: @day, id: @post
    assert_response :success
  end

  it "should get edit" do
    get :edit, group_id: @group, day_id: @day, id: @post
    assert_response :success
  end

  it "should update post" do
    patch :update, group_id: @group, day_id: @day, id: @post, post: {  }
    assert_redirected_to group_day_post_path(@group, @day, assigns(:post))
  end

  it "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, group_id: @group, day_id: @day, id: @post
    end

    assert_redirected_to group_day_posts_path(@group, @day)
  end
end
