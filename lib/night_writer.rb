class NightWriter
  attr_reader :input, 
              :output

  def initialize(input, output)
    @input = input
    @output = output
  end
end

# reader = File.open(ARGV[0], "r")
# incoming_text = reader.read
# reader.close

# capitalize_text = incoming_text.upcase
# writer = File.open(ARGV[1], "w")
# writer.write(capitalize_text)
# writer.close

# puts capitalize_text

# puts "Created '#{ARGV[1]}' containing #{capitalize_text.length} characters"
