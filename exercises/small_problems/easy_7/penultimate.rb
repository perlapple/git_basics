def penultimate(sentence)
  sentence.split[-2]
end

p penultimate('last word') #== 'last'
p penultimate('Launch School is great!') #== 'is'
p penultimate('hello, how are you!') #== 'is'
