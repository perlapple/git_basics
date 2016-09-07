
# if (year is not divisible by 4) then (it is a common year)
# else if (year is not divisible by 100) then (it is a leap year)
# else if (year is not divisible by 400) then (it is a common year)
# else (it is a leap year)

def leap_year?(year)
  leap_year = nil

  if before_1752?(year) && year % 4 == 0 then leap_year = true
  elsif year % 4 != 0 then leap_year = false
  elsif year % 100 != 0 then leap_year = true
  elsif year % 400 != 0  then leap_year = false
  else  leap_year = true
  end

end

def before_1752?(year)
  year <= 1752
end

puts leap_year?(2016)  #== true
puts leap_year?(2015) #== false
puts leap_year?(2100) #== false
puts leap_year?(2400) #== true
puts leap_year?(240000) #== true
puts leap_year?(240001) #== false
puts leap_year?(2000) #== true
puts leap_year?(1900) #== false
puts leap_year?(1752) #== true
puts leap_year?(1700) #== false
puts leap_year?(1) #== false
puts leap_year?(100) #== false
puts leap_year?(400) #== true
