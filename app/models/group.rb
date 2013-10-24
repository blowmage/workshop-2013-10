class Group < ActiveRecord::Base
  validates :name, presence: true

  has_many :memberships
  has_many :users, through: :memberships
  has_many :posts

  def is_member? user
    users.include? user
  end

  def add_member user
    users << user unless is_member? user
  end

  def remove_member user
    users.delete user if is_member? user
  end

  def posts_for date
    posts.where(date: date)
  end

  def post_for user, date
    posts.where(user: user, date: date).first
  end
end
