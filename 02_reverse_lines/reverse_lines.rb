unless ARGV.size == 0
  filename = ARGV[0]
  lines = []
  File.open(filename, "r") do |file|
    file.each_line{ |line| lines << line }
  end
  puts lines.reverse
else
  puts "usage: ruby reverse_lines.rb [filename]\nplease give the filename to reverse"
end