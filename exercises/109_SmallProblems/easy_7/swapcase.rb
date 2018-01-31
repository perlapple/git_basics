
def swapcase(string)
  chars = string.split('')
  chars.chars.each_with_index do |chr, index|
    if ('a'..'z').to_a.include?(chr)
      chars[index] = chr.upcase
    elsif ('A'..'Z').to_a.include?(chr)
      chars[index] = chr.downcase
    end
  end
  chars.join
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'
