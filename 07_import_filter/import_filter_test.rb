require "test/unit"

require "import_filter"

class TestImportFilter < Test::Unit::TestCase
  def test_directory
    filter = ImportFilter.new("java code")
    
    
  end
  
  def test_single_file
    file = "java code/Bar.java"
    filter = ImportFilter.from_file(file)
  end
end