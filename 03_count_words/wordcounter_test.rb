require "test/unit"

require "wordcounter.rb"

class TestWordcounter < Test::Unit::TestCase
  def test_stats_from_string
    string =
<<TEXT
These are the rules of Code Club:
---------------------------------
1)  The first rule of Code Club is, you do talk at Code Club.
2)  The second rule of Code Club is, you DO TALK at Code Club.
3)  If someone forgets to write a test first, coding is over.
4)  Two guys to a screen.
5)  One thing at a time. Especially in classes and methods.
5)  Coding will go on as long, it takes to pass the tests.
6)  If this is your first day at Code Club, you have to code.
TEXT
    
    counter = Wordcounter.new
    counter.create_stats(string)
    
    assert_equal(7, counter.count("code"))
    assert_equal(6, counter.count("CLUB"))
    assert_equal(6, counter.count("club"))
    assert_equal(0, counter.count("ipsum"))
    assert_equal(2, counter.count("Talk"))
  end
  
  def test_stats_from_file
    counter = Wordcounter.new
    File.open("input.txt", "r") do |file|
      counter.create_stats(file)
    end
    
    assert_equal(10, counter.count("Amet"))
    assert_equal(7, counter.count("ipsum"))
    assert_equal(5, counter.count("ante"))
    assert_equal(0, counter.count("actual"))
  end
end