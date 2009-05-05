class Numbercheck
  
  SIGN = /^[-|+]{0,1}/
  NORMAL = /^[0-9]+.[0.9]*/
  SCIENTIFIC = //
  FORMAT = (SIGN & NORMAL) | (SIGN & SCIENTIFIC) 
  
  def self.valid?(string)
    copy = String.new(string)
    
  end
end