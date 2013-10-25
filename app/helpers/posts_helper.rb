module PostsHelper

  def can_add_post?
    @group.present? &&
    @group.is_member?(current_user) &&
    @group.post_for(current_user, @day).nil?
  end

end
