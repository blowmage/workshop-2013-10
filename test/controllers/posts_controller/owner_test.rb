require 'test_helper'

class PostsControllerOwnerTest < ActionController::TestCase
  tests PostsController

  setup do
    @group = groups :payroll
    @day = Date.today
    @post = posts :payroll_carl_today
    # User is Member, and owner of the post
    login_with @post.user
  end

  test "should get index" do
    get :index, group_id: @group, day_id: @day
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, group_id: @group, day_id: @day
    # Redirected because they already have a post
    assert_redirected_to group_day_posts_path(@group, @day)
  end

  test "should create post" do
    # Post not created because user already has a post for this day
    assert_difference 'Post.count', 0 do
      post :create, group_id: @group, day_id: @day, post: {  }
    end

    assert_redirected_to group_day_posts_path(@group, @day)
  end

  test "should show post" do
    get :show, group_id: @group, day_id: @day, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, group_id: @group, day_id: @day, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, group_id: @group, day_id: @day, id: @post, post: {  }
    assert_redirected_to group_day_post_path(@group, @day, assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, group_id: @group, day_id: @day, id: @post
    end

    assert_redirected_to group_day_posts_path(@group, @day)
  end
end
