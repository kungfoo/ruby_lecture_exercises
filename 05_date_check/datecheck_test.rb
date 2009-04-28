require "test/unit"

require "datecheck.rb"

class TestDatecheck < Test::Unit::TestCase
  def setup
    @weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  end
  
  def test_valid_formats
    check_valid("Tue Jan 22 2006 22:23:59")
    check_valid("Wed Feb 30 2009 01:01:59")
    
    @weekdays.each do |weekday|
      @months.each do |month|
        day = "%02d" % (rand(30)+1)
        year = "%04d" % (rand(3000)+1)
        hours = "%02d" % rand(24)
        minutes = "%02d" % rand(59)
        seconds = "%02d" % rand(59)
        
        string = "#{weekday} #{month} #{day} #{year} #{hours}:#{minutes}:#{seconds}"
        check_valid(string)
      end
    end
  end
    
  def test_invalid_formats
    check_invalid("Feb Mon 22 2006")
    check_invalid("Mon Dec 30 1990 25:23:23")
    check_invalid("Mon Mon Mon 30 2009")
    check_invalid("Mon Dec 21 388 23:23:23")
  end
  
  private
  def check_invalid(date)
    assert_equal(false, Datecheck.valid?(date))
  end
  
  def check_valid(date)
    assert_equal(true, Datecheck.valid?(date))
  end
end