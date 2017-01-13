# Write a method that takes an array of strings, and returns an array of the
#  same string values except with the vowels removed.
require 'pry'

VOWELS = [ 'a', 'e', 'i', 'o', 'u']


def remove_vowels(array)
  vowelless = ''
  array.each_char do |char|
    vowelless << char unless VOWELS.include?(char)
  end
  vowelless
end

def remove_vowels(strings)
  strings.map do |string|
    string.split("").reject{ |char| VOWELS.include?(char) }.join("")
  end
end

#p remove_vowels(["hello", "ooiasaww"]).join(', ')

def balancer(string)
  paren_count = 0

  binding.pry
  string.each_char do |chr|
    if paren_count < 0
      break
    elsif chr == '('
      paren_count += 1
    elsif chr == ')'
      paren_count -= 1
    end
  end

  paren_count.zero?
end

p balancer("(d(sfsdf))") # true
p balancer("(d((sfsdf") # false
p balancer("(d)sfsd)f)") # false
p balancer("(()) )(") # false
