# The number of possible UUID values is approximately 3.4 X 10E38.
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 SECTIONS
# like this 8-4-4-4-12 and represented as a string.
CHARACTERS = %w(1 2 3 4 5 6 7 8 9 a b c d e f)
SECTIONS = [8, 4, 4, 4, 12]


def generate_UUID()

  uuid = '';

  SECTIONS.each_with_index do |section, index|
    section.times { uuid += CHARACTERS.sample }
    uuid += '-' unless index >= 4
    end

   uuid
end

puts generate_UUID
