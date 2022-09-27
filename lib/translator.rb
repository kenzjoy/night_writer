class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(letter)
    dictionary.alpha[letter]
  end

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

  def line_control(incoming_text)
    if incoming_text.length > 80
      incoming_text[0..79].join("\n")
    end
      # require 'pry'; binding.pry
  end

  def braille_to_alpha(braille_str)
    dictionary.braille[braille_str]
  end

  def untranslated(braille_str)
    no_break = braille_str.split("\n")
    braille_to_alpha(no_break.join)
  end


end