
def reverse_words(sentence)
  sentence_tokens = sentence.split.map do |token|
    if token.size >= 5
      token.reverse
    else
      token
    end
  end

 sentence_tokens.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
