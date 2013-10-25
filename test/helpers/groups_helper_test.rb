require 'test_helper'

describe GroupsHelper do

  let(:current_user) { users :mike }

  before do
    @group = groups :payroll
  end

  describe :is_member? do
    it "passes when current_user is a member" do
      @group.is_member?(current_user).must_be :present?
      is_member?.must_be :present?
    end

    it "fails when there is no group" do
      @group = nil
      is_member?.must_be :blank?
    end

    describe :nonmember do
      let(:current_user) { users :zach }

      it "fails when current_user is a nonmember" do
        @group.is_member?(current_user).must_be :blank?
        is_member?.must_be :blank?
      end
    end

    describe :anonymous do
      let(:current_user) { nil }

      it "fails when there is no current_user" do
        is_member?.must_be :blank?
      end

      it "fails when there is no group or current_user" do
        @group = nil
      is_member?.must_be :blank?
      end
    end
  end
end
