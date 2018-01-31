MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def time_of_day(integer)
  integer =  integer % MINUTES_PER_DAY
  hours, minutes = integer.divmod(MINUTES_PER_HOUR)
  "#{hours}:#{minutes}"
end

puts time_of_day(0) #== "00:00"
puts time_of_day(-3) #== "23:57"
puts time_of_day(35) #== "00:35"
puts time_of_day(-1437) #== "00:03"
puts time_of_day(3000) #== "02:00"
puts time_of_day(800) #== "13:20"
puts time_of_day(-4231) #== "01:29"
