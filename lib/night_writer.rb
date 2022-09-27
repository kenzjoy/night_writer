require './lib/dictionary'
require './lib/translator'
  
translator = Translator.new

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

# This conditional is here in the case that my line_control method
# was passing, but since it is not, I have it commented out so you can
# see the programming functionally running with what does work. 

# if incoming_text > 80
#   braille = translator.line_control(incoming_text)
# else
#   braille = translator.translated(incoming_text)
# end
# # # #

braille = translator.translated(incoming_text)

writer_file = File.open(ARGV[1], "w")
writer_file.write(braille)
writer_file.close

puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"

# ruby ./lib/night_writer.rb message.txt braille.txt