require 'test_helper'

class GroupPostTest < ActiveSupport::TestCase
  def group
    @group ||= groups :payroll
  end

  def test_posts_for
    assert_equal 3, group.posts_for(Date.today).count
    assert_equal 3, group.posts_for(Date.yesterday).count
    assert_equal 0, group.posts_for(Date.tomorrow).count
  end

  def test_posts_for_today
    assert_includes group.posts_for(Date.today), posts(:payroll_ben_today)
  end

  def test_posts_for_yesterday
    assert_includes group.posts_for(Date.yesterday), posts(:payroll_ben_yesterday)
  end

  def test_post_for
    assert_equal posts(:payroll_carl_today),
                 group.post_for(users(:carl), Date.today)
    assert_equal posts(:payroll_heidi_yesterday),
                 group.post_for(users(:heidi), Date.yesterday)
    assert_equal posts(:payroll_jack_today),
                 group.post_for(users(:jack), Date.today)
    assert_nil group.post_for(users(:mike), Date.today)
  end

  def test_add_post
    # mike doesn't have any posts for payroll
    mike = users :mike
    assert_difference "Post.count", 1 do
      group.add_post mike, Date.today, "I'm late, but I got it done."
    end
  end

  def test_add_post_wont_create_duplicates
    # ben already has a post for payroll
    ben = users :ben
    assert_difference "Post.count", 0 do
      post = group.add_post ben, Date.today, "This is a duplicate."
      refute post.valid?
    end
  end
end
