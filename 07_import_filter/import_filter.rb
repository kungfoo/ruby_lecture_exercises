class ImportFilter
  def initialize(directory)
    @directory = directory
    @files = Dir.chdir(@directory) { Dir.glob("*.java") }
  end
  
  def self.from_file(file)
    @directory = nil
    @files = [file]
  end
  
  def imports
    
  end
end