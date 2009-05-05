class RegexpOr
  def initialize(r1,r2)
    @r1, @r2 = r1, r2
  end
  
  def =~(str)
    @r1 =~ str or @r2 =~ str
  end
end

class RegexpAnd
  def initialize(r1,r2)
    @r1, @r2 = r1, r2
  end
  
  def =~(str)
    @r1 =~ str and @r2 =~ str
  end
end

class Regexp
  def |(other)
    RegexpOr.new(self, other)
  end
  
  def &(other)
    RegexpAnd.new(self, other)
  end
end

class Numbercheck
  
  SIGN = /^[-|+]{0,1}/
  NORMAL = /^[0-9]+.[0.9]*/
  SCIENTIFIC = //
  FORMAT = (SIGN & NORMAL) | (SIGN & SCIENTIFIC) 
  
  def self.valid?(string)
    copy = String.new(string)
    
  end
end