require "test/unit"

require "import_filter"

class Array
  # same elements as far as <=> goes. no duplicates allowed.
  def same_elements?(array)
    if self.size != array.size
      return false
    else
      return self.sort == array.sort
    end
  end
end

class TestImportFilter < Test::Unit::TestCase
  def setup
    @bar_imports = ["foo.bar.baz.Banane", "mk.dir.Dir", "fd.fd.fd.*", "foo.domain.Kunde"]
    @foo_imports = ["foo.bar.baz.Foo", "mk.dir.Dir", "fd.fd.fd.*"]
    @region_imports = ["ch.hsr.ibis.common.Feature", "ch.hsr.ibis.matrix.EllipseOperations", "ch.hsr.ibis.matrix.Matrix", "ch.hsr.ibis.mser.MSERDetector.PixelForest"]
    @unique_imports = (@bar_imports + @foo_imports + @region_imports).uniq!
  end

  def test_directory
    filter = ImportFilter.new("java code")
    imports = filter.imports
    assert_equal(true, imports.same_elements?(@unique_imports), "imports should contain \n#{@unique_imports.inspect}\nbut was \n#{imports.inspect}")
  end

  def test_single_file
    file = "java code/Bar.java"
    filter = ImportFilter.from_file(file)
  end

  def test_array_contains_same_elements
    assert_equal(true, [1,2,3].same_elements?([3,2,1]))
    assert_equal(false, [1,2,3].same_elements?([1,2]))
  end

  def test_each_file
    filter = ImportFilter.new("java code")
    filter.each_file do |file|

    end
  end
end