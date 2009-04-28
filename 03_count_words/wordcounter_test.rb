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

      stats = Wordcounter.new
      stats.create_stats(string)

      assert_equal(7, stats.count("code"))
      assert_equal(6, stats.count("CLUB"))
      assert_equal(6, stats.count("club"))
      assert_equal(0, stats.count("ipsum"))
      assert_equal(2, stats.count("Talk"))
    end

    def test_stats_from_file
      stats = filler_stats
      assert_equal(10, stats.count("Amet"))
      assert_equal(7, stats.count("ipsum"))
      assert_equal(5, stats.count("ante"))
      assert_equal(0, stats.count("actual"))
    end

    def test_n_most_occurring
      stats = filler_stats
      most_occurring = stats.most_occurring(10)
      assert_equal(10, most_occurring.size)
    end

    def test_n_least_occurring
      stats = filler_stats
      least_occurring = stats.least_occurring(13)
      assert_equal(13, least_occurring.size)
    end

    private
    def filler_stats
      stats = Wordcounter.new
      File.open("input.txt", "r") do |file|
        stats.create_stats(file)
      end
      stats
    end
  end