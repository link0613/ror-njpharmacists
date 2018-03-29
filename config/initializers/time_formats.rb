Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:month_day_year] = lambda { |time| time.strftime("%B %e, %Y") }
Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%a, %b %e at %l:%M") + time.strftime("%p").downcase }