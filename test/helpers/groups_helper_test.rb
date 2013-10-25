require 'test_helper'

class GroupsHelperTest < ActionView::TestCase

  def current_user
    users :mike
  end

  def setup
    @group = groups :payroll
  end

  def test_is_member?
    assert @group.is_member? current_user
    assert is_member?
  end

end
