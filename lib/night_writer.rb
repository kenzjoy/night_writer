require './lib/dictionary'
require './lib/translator'
  
reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

translator = Translator.new
braille = translator.alpha_to_braille(incoming_text)
# variable = value
writer_file = File.open(ARGV[1], "w")
writer_file.write(braille)
writer_file.close

# capitalize test
# ruby ./lib/night_writer.rb message.txt capitalize.txt
# capitalize_text = incoming_text.upcase
# capitalize = File.open(ARGV[1], "w")
# capitalize.write(capitalize_text)
# capitalize.close

# puts capitalize_text

puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"
