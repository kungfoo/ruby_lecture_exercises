if ARGV.size == 0
  @n = gets.to_i
else
  @n = ARGV[0].to_i
end

puts "42\n" * @n