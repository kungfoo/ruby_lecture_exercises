require "test/unit"

require "numbercheck"

class TestNumbercheck < Test::Unit::TestCase
  def test_valid_one_point_zero
    check_valid_strings(["1.0", "1.", "-1.0", "-1.", "+1.0", "+1."])
  end
  
  def test_valid_point_zero
    check_valid_strings(["0.1", ".1", "-0.1", "+0.1", "-.1", "+.1"])
  end
  
  def test_invalid_one_point_zero
    check_invalid_strings(["1", "+1", "-1"])
  end
  
  def test_valid_euler
    check_valid_strings(["2.71828183","-2.71828183","+2.71828183"])
  end
  
  def test_check_invalid_euler
    check_invalid_strings(["++2.71828183","--2.71828183", "+-2.71828183"])
  end
  
  def test_check_valid_scientific
    check_valid_strings(["1.0e-7", "1.21e+72", "1.21e-128", ".1e7", ".21e-17"])
  end
  
  def test_invalid_scientific
    check_invalid_strings(["1e", "e1", "1.e", "-e1.0"])
  end
  
  def test_single_point
    assert_equal(false, Numbercheck.valid?("."))
  end
  
  def test_test_integer_numbers
    check_invalid_strings(["1", "2", "-1", "-2", "242347239874", "-423897492873"])
  end
  
  def check_valid_strings(strings)
    strings.each do |str|
      assert_equal(true, Numbercheck.valid?(str), "#{str} did not pass")
    end
  end
  
  def check_invalid_strings(strings)
    strings.each do |str|
      assert_equal(false, Numbercheck.valid?(str), "#{str} did not fail")
    end
  end
end