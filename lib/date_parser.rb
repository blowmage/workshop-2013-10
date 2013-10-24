module DateParser
  def self.parse input
    case input
    when "today"
      Date.today
    when "yesterday"
      Date.yesterday
    when "tomorrow"
      Date.tomorrow
    else
      Date.parse input.to_s
    end
  rescue ArgumentError
    nil
  end
end
