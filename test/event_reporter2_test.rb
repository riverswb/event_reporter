require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter2.rb'

class DataFileTest < Minitest::Test

  def test_default_file
    df = DataFile.new

    assert_equal "event_attendees_small.csv", df.default_file
  end

  def test_default_file_is_current_file_path

    df = DataFile.new
    df.set_path(nil)
    df.set_path

    assert_equal df.default_file, df.current_file_path
  end

  def test_can_accept_another_csv_file

    df = DataFile.new

    df.set_path("event_attendees.csv")

    assert_equal "event_attendees.csv", df.current_file_path
  end

  def test_set_path_will_not_accept_non_csv_files

    df = DataFile.new

    df.set_path("this_better_not_work.txt")

    assert_equal "event_attendees_small.csv", df.current_file_path
  end

  def test_load_file_will_load_a_new_csv_file
    df = DataFile.new

    df.set_path("event_attendees.csv")

  #  assert df.load_file
    assert_equal "event_attendees.csv", df.current_file_path
  end

  def test_can_fill_queue_with_records_mattching_criteria_for_attribute
    df = DataFile.new
    df.set_path("event_attendees.csv")
    df.load_file
    df.find_by("first_name", "Shannon")

    p @queue
  end

end
