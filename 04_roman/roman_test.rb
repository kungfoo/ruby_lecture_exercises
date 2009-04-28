require "test/unit"

require "roman.rb"

class TestRoman < Test::Unit::TestCase
  def test_to_roman
    check_conversion(15, "XV")
    check_conversion(14, "XIV")
    check_conversion(3, "III")
    check_conversion(100, "C")
    check_conversion(101, "CI")
    check_conversion(104, "CIV")
    check_conversion(1990, "MCMXC")
    check_conversion(9, "IX")
  end

  def test_range_of_values
    1.upto(2121) do |i|
      roman = i.to_roman
      decimal = Integer.from_roman(roman)
      assert_equal(i, decimal)
    end
  end

  private
  def check_conversion(number, string)
    roman = number.to_roman
    assert_equal(string, roman)
    decimal = Integer.from_roman(roman)
    assert_equal(number, decimal)
  end
end