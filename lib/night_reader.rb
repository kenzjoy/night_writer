require './lib/dictionary'
require './lib/translator'

translator = Translator.new

braille_file = File.open(ARGV[0], "r")
incoming_braille = braille_file.read
braille_file.close

to_english = translator.translated(incoming_braille)

writer_file = File.open(ARGV[1], "w")
writer_file.write(to_english)
writer_file.close

puts "Created '#{ARGV[1]}' containing #{to_english.length} characters"

# ruby ./lib/night_reader.rb braille.txt original_message.txt