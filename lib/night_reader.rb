require './lib/dictionary'
require './lib/translator'

translator = Translator.new

braille_file = File.open(ARGV[0], "r")
braille_str = braille_file.read
braille_file.close

to_english = translator.braille_to_alpha(braille_str)

writer_file = File.open(ARGV[1], "w")
writer_file.write(to_english)
writer_file.close

puts "Created '#{ARGV[1]}' containing #{to_english.length} characters"

# => insert this braille string into braille.txt to see it function: 0..000
# ruby ./lib/night_reader.rb braille.txt original_message.txt