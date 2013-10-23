require "minitest/autorun"

class HelloWorld
  def greet name = "world"
    "Hello #{name}!"
  end
end

class HelloWorldTest < MiniTest::Unit::TestCase
  def greeter
    @greeter ||= HelloWorld.new
  end

  def test_greeting
    assert_equal "Hello world!", greeter.greet
  end

  def test_greeting_with_name
    assert_equal "Hello Mike!", greeter.greet("Mike")
  end

  def test_greeting_is_a_string
    assert greeter.greet.instance_of?(String)
    assert_instance_of String, greeter.greet
  end
end
