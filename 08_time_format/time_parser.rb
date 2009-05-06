class TimeParser
  HOURS = /^\d{1,2}:/
  MINUTES = /^\d{2}\s*/
  AM_PM = /^(am|pm|AM|PM)$/
  FORMAT = [HOURS, MINUTES, AM_PM]

  HOURS_RANGE = (0..12)
  MINUTES_RANGE = (0..59)

  attr_reader :hours, :minutes

  def self.valid?(string)
    copy = String.new(string)
    FORMAT.each do |part|
      if copy =~ part
        copy.gsub!(part, "")
      else
        return false
      end
    end
    return true
  end

  def initialize(string)
    raise(ArgumentError, 'The format is not valid') unless TimeParser.valid?(string)
    string = String.new(string)
    parse_hours(string)
    parse_minutes(string)
    parse_am_pm(string)
  end

  def parse_hours(string)
    match = string.match(HOURS)
    string.gsub!(HOURS, "")
    matched_string = match.to_s.gsub!(/:/,'')
    @hours = matched_string.to_i
    raise(ArgumentError, 'The hours should be in (0..12)') unless HOURS_RANGE === @hours
  end

  def parse_minutes(string)
    match = string.match(MINUTES)
    string.gsub!(MINUTES, '')
    @minutes = match.to_s.to_i
    raise(ArgumentError, 'Minutes should be in (0..59)') unless MINUTES_RANGE === @minutes
  end

  def parse_am_pm(string)
    case string
    when /(pm|PM)/
      @hours += 12 if @hours < 12
    when /(am|AM)/
      @hours = 0 if @hours == 12
    else
      raise('something is terribly wrong with the code...')
    end
  end
end
