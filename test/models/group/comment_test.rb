require 'test_helper'

class GroupCommentTest < ActiveSupport::TestCase
  def group
    @group ||= groups :payroll
  end

  def post
    @post ||= posts :payroll_carl_today
  end

  def test_add_comment
    mike = users :mike
    assert_difference "Comment.count", 1 do
      group.add_comment mike, post, "Please don't fire me."
    end
  end
end
