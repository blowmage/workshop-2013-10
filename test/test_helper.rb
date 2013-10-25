ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  def login_with user
    session[:user_id] = user.try :id
  end
end

class Object
  infect_an_assertion :assert, :must_be_true, :unary
  infect_an_assertion :refute, :must_be_false, :unary
  infect_an_assertion :assert, :wont_be_false, :unary
  infect_an_assertion :refute, :wont_be_true, :unary
end
