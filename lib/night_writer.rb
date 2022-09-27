require './lib/dictionary'
require './lib/translator'
  
translator = Translator.new

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

braille = translator.alpha_to_braille(incoming_text)

writer_file = File.open(ARGV[1], "w")
writer_file.write(braille)
writer_file.close

puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"
