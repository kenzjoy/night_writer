class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(string)
    translated = ""
    dictionary.alpha.each do |key, value|
      if string == key
        translated << value 
      end
    end
    translated
  end

  def stacked_braille(string)
    stack_1 = ""
    stack_2 = ""
    stack_3 = ""
    stack_1 << alpha_to_braille(string).chars[0..1].join
    stack_2 << alpha_to_braille(string).chars[2..3].join
    stack_3 << alpha_to_braille(string).chars[4..5].join
    "#{stack_1}\n" + "#{stack_2}\n" + "#{stack_3}"
# require 'pry'; binding.pry
      
  end
end