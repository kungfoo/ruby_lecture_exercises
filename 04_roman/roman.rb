class Integer

  @@romanlist = [["M", 1000], ["CM", 900], ["D",  500],["CD", 400],["C",  100],["XC",  90],["L",   50],["XL",  40],["X",   10],["IX",   9],["V",    5],["IV",   4],["I",    1]]

  def to_roman
    remains = self
    roman = ""
    @@romanlist.each do |sym, num|
      while remains >= num
        remains -= num
        roman << sym
      end
    end
    roman
  end

  def Integer.from_roman(roman)
    ustr = roman.upcase
    sum = 0
    @@romanlist.each do |sym, num|
      while sym == ustr[0, sym.length]
        sum += num
        ustr.slice!(0, sym.length)
      end
    end
    sum
  end
end
