require 'test/unit'
require "time_parser"

class TestTimeParser < Test::Unit::TestCase
  def test_valid_strings 
    valid_strings do |string|
      assert_equal(true, TimeParser.valid?(string))   
    end
  end
  
  def test_invalid_strings
    invalid_strings do |string|
      assert_equal(false, TimeParser.valid?(string))   
    end
  end
  
  def test_raise_on_invalid_syntax
    invalid_strings do |string|
      assert_raise(ArgumentError) do
        TimeParser.new(string)
      end
    end
  end
  
  def test_raise_on_invalid_hours
    string = "13:10am"
    assert_raise(ArgumentError) do
      TimeParser.new(string)
    end
  end
  
  def test_raise_on_invalid_minutes
    string = "12:99 am"
    assert_raise(ArgumentError) do
      TimeParser.new(string)
    end
  end
  
  def test_valid_string_parse
    expected = [[0, 10], [0, 10], [9,59], [9,59], [1,58], [12,10], [12,13], [21,59], [21,59], [13,58], [23,59]]
    i = 0
    valid_strings do |string|
      parser = TimeParser.new(string)
      expected_hours, expected_minutes = expected[i]
      assert_equal(expected_hours, parser.hours)
      assert_equal(expected_minutes, parser.minutes)
      i += 1      
    end
  end
  
  private
  def invalid_strings
    ["12:12", "12,12 am", "09:09", "fff", "ff:ff am", "12:3 pm"].each do |string|
      yield string
    end
  end
  
  def valid_strings
    ["12:10 am", "12:10am", "9:59 AM" , "9:59AM", "01:58am", "12:10 pm", "12:13pm", "9:59 PM" , "9:59PM", "01:58pm", "11:59pm"].each do |string|
      yield string
    end
  end
end
