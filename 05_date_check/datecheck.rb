class Datecheck
  @@weekday = /^(Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s+/
  @@month = /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s+/
  @@day = /^\d{2}\s+/
  @@year = /^\d{4}\s+/
  @@time = /^[0-2][0-4]:[0-5][0-9]:[0-5][0-9]\s*/
  @@parts = [@@weekday, @@month, @@day, @@year, @@time]

  def self.valid?(string)
    @@parts.each do |r|
      if string =~ r
        string.gsub!(r, "")
      else
        return false
      end
    end

    return true
  end
end