require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    login_with users(:mike)
    @group = groups :payroll
    @day = Date.today
    @post = posts :payroll_carl_today
  end

  test "should get new" do
    get :new, group_id: @group, day_id: @day, post_id: @post
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, group_id: @group, day_id: @day, post_id: @post,
                    comment: { body: "new!" }
    end

    assert_redirected_to group_day_post_url assigns(:comment).post.group,
                                            assigns(:comment).post.date,
                                            assigns(:comment).post
  end
end
