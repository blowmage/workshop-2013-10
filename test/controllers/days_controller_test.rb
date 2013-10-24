require 'test_helper'

class DaysControllerTest < ActionController::TestCase
  def group
    @group ||= groups :payroll
  end

  test "should get index" do
    get :index, group_id: group
    assert_response :success
  end

  test "should get show" do
    get :show, group_id: group, id: Date.today
    assert_response :success
  end

  def test_show_invalid_date
    get :show, group_id: group, id: "muah-hah-hah"
    assert_redirected_to group_path(group)
  end
end
