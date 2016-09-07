require './lib/event_reporter.rb'
require 'minitest/autorun'
require 'minitest/pride'


class SunTest < Minitest::Test

  def test_can_find_by_zipcode
    skip
    s = Sun.new

    p s.legislators_by_zipcode(80525)

  end

  def test_legislators_by_state
    s = Sun.new


    assert s.legislators_by_state("80525")
  end

  # def test_can_find_by_first_name
  #   s = Sun.new
  #
  #   assert s.legislators_by_first_name("John")
  # end
end # end of class
