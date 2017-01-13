
def ask_words
  words = { noun: '', verb: '', adjective: '', adverb: '' }

  puts 'Enter a noun:'
  words[:noun] = gets.chomp.to_s
  puts 'Enter a verb:'
  words[:verb] = gets.chomp.to_s
  puts 'Enter an adjective:'
  words[:adjective] = gets.chomp.to_s
  puts 'Enter an adverb:'
  words[:adverb] = gets.chomp.to_s

  words
end

def madlibs(words)
  "Do you #{words[:verb]} your #{words[:adjetive]}#{words[:noun]} #{words[:adverb]}? That's hilarious!"
end

p madlibs(ask_words)
