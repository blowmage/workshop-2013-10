require 'test_helper'

class PostsHelperTest < ActionView::TestCase

  def current_user
    @current_user
  end

  def setup
    @group = groups :payroll
    @day = Date.today
    @current_user = nil

    @member_with_post = users :ben
    @member_no_post = users :mike
    @nonmember = users :zach

    # Test preconditions
    assert @group.is_member?(@member_with_post)
    assert @group.is_member?(@member_no_post)
    refute @group.is_member?(@nonmember)

    assert @group.post_for(@member_with_post, @day)
    refute @group.post_for(@member_no_post, @day)
  end

  def test_can_add_post_member_with_post
    @current_user = @member_with_post
    refute can_add_post?
  end

  def test_can_add_post_no_post
    @current_user = @member_no_post
    assert can_add_post?
  end

  def test_can_add_post_nonmember
    @current_user = @nonmember
    refute can_add_post?
  end

  def test_can_add_post_no_user
    @current_user = nil
    refute can_add_post?
  end

  def test_can_add_post_bad_data
    @group = @day = @current_user = nil
    refute can_add_post?
  end

end
