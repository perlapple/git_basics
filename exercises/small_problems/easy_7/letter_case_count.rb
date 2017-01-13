UPPERCASE_LETTERS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
LOWERCASE_LETTERS = %w(a b c d ch d e f g h i j k l m n ñ o p q r s t u v w x y z)

def letter_case_count(string)
  counts = Hash.new(0)

  string.each_char do |chr|
    if UPPERCASE_LETTERS.include? chr
      counts[:uppercase] += 1
    elsif LOWERCASE_LETTERS.include? chr
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }
