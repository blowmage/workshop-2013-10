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
end
