require "test_helper"
require "date_parser"

class DateParserTest < MiniTest::Unit::TestCase
  def test_parse
    assert_nil parse(nil)
    assert_nil parse("")
    assert_nil parse("booya")
    assert_equal Date.today, parse("today")
    assert_equal Date.yesterday, parse("yesterday")
    assert_equal Date.tomorrow, parse("tomorrow")
    assert_equal Date.new(2012,12,21), parse("2012-12-21")
  end

  def parse input
    DateParser.parse input
  end
end
