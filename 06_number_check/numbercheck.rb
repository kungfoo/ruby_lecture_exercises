class Numbercheck
  
  NORMAL = /^((\-|\+){0,1}[0-9]*\.[0-9]+)|^((\-|\+){0,1}[0-9]+\.[0-9]*)$/
  SCIENTIFIC = /^(\-|\+){0,1}[0-9]*\.[0-9]+e(\+|\-)[0-9]+$/
  
  def self.valid?(string)
    (string =~ NORMAL) != nil or (string =~ SCIENTIFIC) != nil
  end
end