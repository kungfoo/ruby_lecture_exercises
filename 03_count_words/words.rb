usage = <<USAGE
usage:
  ruby words.rb [options] [filename]

options:
  -h    show this message
  -s    read from stdin instead of file
  -n    show only n most occurring words
  +n    n least occurring words
USAGE

unless ARGV.size == 0
  
else
  puts usage
end