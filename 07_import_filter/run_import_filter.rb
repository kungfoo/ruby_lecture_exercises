require "import_filter"

dir = "java code"
filter = ImportFilter.new(dir)
puts "imports used by files in '#{dir}'\n" << "-"*50

filter.imports.each do |import|
  puts import
end