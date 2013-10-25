require 'test_helper'

class GroupsHelperTest < ActionView::TestCase

  def current_user
    @current_user
  end

  def setup
    @group = groups :payroll
    @current_user = users :mike
  end

  def test_is_member_member
    assert @group.is_member? current_user
    assert is_member?
  end

  def test_is_member_member
    @current_user = users :zach
    refute @group.is_member? current_user
    refute is_member?
  end

  def test_is_member_no_user
    @current_user = nil
    refute is_member?
  end

  def test_is_member_no_group
    @group = nil
    refute is_member?
  end

  def test_is_member_no_user_no_group
    @group = nil
    @current_user = nil
    refute is_member?
  end
end
