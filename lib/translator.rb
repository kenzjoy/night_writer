class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(letter)
    translated = ""
    dictionary.alpha.each do |key, value|
      if letter == key
        translated << value 
      end
    end
    translated
  end

  # def stacked_braille(letter)
  #   stack_1 = ""
  #   stack_2 = ""
  #   stack_3 = ""
  #   stack_1 << alpha_to_braille(letter).chars[0..1].join
  #   stack_2 << alpha_to_braille(letter).chars[2..3].join
  #   stack_3 << alpha_to_braille(letter).chars[4..5].join
  #   "#{stack_1}\n" + "#{stack_2}\n" + "#{stack_3}"      
  # end

  def translated(incoming_text)
    stack_1 = ""
    stack_2 = ""
    stack_3 = ""
    incoming_text.chars.each do |letter|
      stack_1 << alpha_to_braille(letter)[0..1]
      stack_2 << alpha_to_braille(letter)[2..3]
      stack_3 << alpha_to_braille(letter)[4..5]
    end
    [stack_1, stack_2, stack_3].join("\n")
  end
end