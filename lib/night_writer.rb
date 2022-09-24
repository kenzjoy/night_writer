# require 'new files'
  
reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

# variable = value
# writer_file = File.open(ARGV[1], "w")
# writer_file.write(variable)
# writer_file.close

# capitalize test
# ruby ./lib/night_writer.rb message.txt capitalize.txt
capitalize_text = incoming_text.upcase
capitalize = File.open(ARGV[1], "w")
capitalize.write(capitalize_text)
capitalize.close

puts capitalize_text
puts "Created '#{ARGV[1]}' containing #{capitalize_text.length} characters"
