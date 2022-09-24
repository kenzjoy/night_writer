class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(string)
    translated = []
    dictionary.alpha.each do |key, value|
      require 'pry'; binding.pry
      if string == key
        translated << value 
      end
    end
    translated
  end
end