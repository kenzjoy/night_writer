class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(string)
    translated = []
    dictionary.alpha.each do |key, value|
      if string == key
        translated << value 
      end
    end
    translated.shift
  end

  # def stacked_braille(string)
  #   stack_1 = ""
  #   stack_2 = ""
  #   stack_3 = ""
  #   string.chars.each do |char|
  #     alpha[char][0..1]

  #     end
  #   end
  # end
end