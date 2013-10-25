module GroupsHelper

  def is_member?
    @group && @group.is_member?(current_user)
  end

end
