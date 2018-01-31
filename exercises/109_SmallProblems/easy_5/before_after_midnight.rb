def before_midnight(time)
  hours_and_minutes = time.split(':')
  -(hours_and_minutes[0].to_i % -24 * 60 + hours_and_minutes[1].to_i)
end

def after_midnight(time)
  hours_and_minutes = time.split(':')
  hours_and_minutes[0].to_i % 24 * 60 + hours_and_minutes[1].to_i
end

#puts after_midnight('00:00') #== 0
# puts before_midnight('00:00') #== 0
 puts after_midnight('12:34') #== 754
 puts before_midnight('12:34') #== 686
 puts after_midnight('24:00') #== 0
 puts before_midnight('24:00') #== 0
