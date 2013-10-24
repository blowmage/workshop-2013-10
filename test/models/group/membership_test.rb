require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase
  def group
    @group ||= groups :payroll
  end

  def member
    @member ||= users :ben
  end

  def nonmember
    @nonmember ||= users :zach
  end

  def test_is_member_positive
    assert group.is_member?(member)
  end

  def test_is_member_negative
    refute group.is_member?(nonmember)
  end

  def test_add_member
    refute group.is_member?(nonmember)
    group.add_member nonmember
    assert group.is_member?(nonmember)
  end

  def test_add_member_doesnt_raise
    assert group.is_member?(member)
    group.add_member member
    assert group.is_member?(member)
  end

  def test_remove_member
    assert group.is_member?(member)
    group.remove_member member
    refute group.is_member?(member)
  end

  def test_remove_member_doesnt_raise
    refute group.is_member?(nonmember)
    group.remove_member nonmember
    refute group.is_member?(nonmember)
  end
end
