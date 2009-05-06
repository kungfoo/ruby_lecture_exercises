class ImportFilter
  IMPORT_LINE = /import\s+.*?;$/

  def initialize(directory)
    @directory = directory
    @files = Dir.chdir(@directory) { Dir.glob("*.java") }
  end

  def imports
    imports = []
    Dir.chdir(@directory) do
      @files.each do |file|
        scan_file_for_imports(file, imports)
      end
    end
    return imports.uniq
  end
  
  private
  def scan_file_for_imports(file, imports)
    File.open(file, "r") do |file|
      file.each_line do |line|
        if line =~ IMPORT_LINE
          imports << line.chomp!.gsub!(/import\s+/,"").gsub!(";","")
        end
      end
    end
  end
end