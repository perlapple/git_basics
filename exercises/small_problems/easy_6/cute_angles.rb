
def dms(angle)
  degrees = angle.to_i # 76
  # Round to 5 decimal places to compensate for floating point math error margin
  decimals = (angle - degrees).round(5) # .73

  # Convert decimal part to minutes
  minutes_and_seconds = (decimals * 60).round(5) # 43.8
  minutes = minutes_and_seconds.to_i # 43
  seconds = (minutes_and_seconds - minutes).round(5) * 60

  format(%(#{degrees}'°'%02d'%02d"), minutes, seconds)
end


puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
