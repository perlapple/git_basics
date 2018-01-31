
def swap(sentence)

  words = sentence.split(" ")

  words.each do |word|
    first_char = word.chars.first
    last_char = word.chars.last
    word[0] = last_char
    word[-1] = first_char
  end

  words.join(' ')
end

puts swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') #== 'ebcdA'
puts swap('a') #== 'a'
