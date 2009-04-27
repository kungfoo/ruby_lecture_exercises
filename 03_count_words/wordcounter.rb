class Wordcounter
  def initialize
    @stats = Hash.new(0)
  end
  
  def create_stats(stream)
    stream.each_line do |line|
      line.scan(/\w+/).each do |word|
        @stats[word.downcase] += 1
      end
    end
    return @stats
  end
  
  def count(word)
    return @stats[word.downcase]
  end
  
  def print_stats(stats = @stats)
    stats.sort{ |a,b| b[1]<=>a[1] }.each do |word, num|
      puts "#{word.ljust(15)} #{num} " +
      case num
        when 1 : "time"
        else "times"
      end
    end
  end
end