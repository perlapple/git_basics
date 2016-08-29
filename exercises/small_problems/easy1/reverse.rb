
def reverse_sentence(sentence)
  sentence_tokens = sentence.split
  sentence_tokens.reverse.join(' ')
end


puts reverse_sentence('')
puts reverse_sentence('Hello World')
puts reverse_sentence('Reverse these words')
