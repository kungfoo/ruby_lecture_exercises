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
    sort_descending.each do |word, num|
      puts "#{word.ljust(15)} #{num} " +
      case num
      when 1 : "time"
      else "times"
      end
    end
  end

  def most_occurring(n)
    pairs = sort_descending.slice(0, n)
    pairs_to_hash(pairs)
  end

  def least_occurring(n)
    pairs = sort_ascending.slice(0, n)
    pairs_to_hash(pairs)
  end

  private
  def sort_ascending
    @stats.sort{ |a,b| a[1]<=>b[1] }
  end

  def sort_descending
    @stats.sort{ |a,b| b[1]<=>a[1] }
  end

  def pairs_to_hash(array)
    hash = Hash.new
    array.each{ |key,value| hash[key] = value }
    return hash
  end
end