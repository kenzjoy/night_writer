class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

  def alpha_to_braille(letter)
    dictionary.alpha[letter]
  end

  # I had originally deleted this method because it was only doing one
  # thing in my program (returning a single formatted braille char), but
  # I brought it back when I was working through some of the harder problems
  # with my mentor. 
  def stacked_braille(letter)
    stack_1 = ""
    stack_2 = ""
    stack_3 = ""
    stack_1 << alpha_to_braille(letter).chars[0..1].join
    stack_2 << alpha_to_braille(letter).chars[2..3].join
    stack_3 << alpha_to_braille(letter).chars[4..5].join
    "#{stack_1}\n" + "#{stack_2}\n" + "#{stack_3}"      
  end
  # # # #

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

  # this method is seemingly returning the correct expected outcome,
  # but is not passing for some reason. This lack of a pass is where I 
  # am short on iteraton 2
  def line_control(incoming_text)
    split_index = ( incoming_text.length - 80 ) * ( -2 )
    trans = translated(incoming_text).split
    joined_arr = trans.map do |line|
      line[0..split_index]
      line.insert(-1, "\n")
    end
    controlled = joined_arr.join(",")
    
    stack = ""
    translated(incoming_text).split.each_with_index do |line, index|
      stack << line[split_index..-1]
      if index < 2
        stack << "\n"
      end
    end
    controlled.insert(-1, stack)
  end
    
  def braille_to_alpha(braille_str)
    dictionary.braille[braille_str]
  end

  # I was talking through this with my mentor. Ultimately, I got a bit tired
  # and decided to quit here for now and turn this in as it is. I think we rest
  # I will be able to come back to this and get my desired outcomes from the test.
  def untranslated(braille_str)
    no_break = braille_str.split("\n")
    # require 'pry'; binding
    # new_str = braille_to_alpha(no_break.join)
    # require 'pry'; binding.pry
    # sliced = new_str.chars.each_slice(3).map(&:join)
    # stack_1 = ""
    # stack_2 = ""
    # stack_3 = ""
    arr = []
    no_break.each_with_index do |string, index|
      string.split("").each_cons(2) do |x, y|
      arr << string[0..1] << string[2..3] << string[4..5]
    end
  end
    # [stack_1, stack_2, stack_3].join
    # require 'pry'; binding.pry
  end
end