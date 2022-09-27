require_relative './spec_helper'

RSpec.describe Translator do
  before(:each) do
    @translator = Translator.new
    @dictionary = Dictionary.new
  end

    it 'exists' do
      expect(@translator).to be_a(Translator)
    end

    it 'has attributes' do
      expect(@translator.dictionary).to be_a(Dictionary)
    end

  describe '#alpha_to_braille' do 
    it 'translates an alpha character argument to braille' do 
      expect(@translator.alpha_to_braille('f')).to eq("000...")
      expect(@translator.alpha_to_braille('o')).to eq("0..00.")
      expect(@translator.alpha_to_braille('x')).to eq("00..00")
    end
  end

  describe '#translated' do
    it 'translates multiple characters/words from english to braille' do
      expect(@translator.translated('a')).to eq("0.\n..\n..")
      expect(@translator.translated('l o v e')).to eq("0...0...0...0.\n0....0..0....0\n0...0...00....")
      expect(@translator.translated('give')).to eq("00.00.0.\n000.0..0\n....00..")  
      expect(@translator.translated('give me a break')).to eq("00.00.0...000...0...0.0.0.0.0.\n000.0..0.....0......0.00.0....\n....00....0...........0.....0.")  
    end
  end

  describe '#line_control' do
    xit 'keeps the translated braille less than 40 chars wide/80 english chars' do 
      expect(@translator.line_control('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz')).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0\n0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\n0.0.\n.0.0\n0000")
      expect(@translator.line_control('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................................................................................................\n................................................................................................................................................................")
    end
  end

  describe '#braille_to_alpha' do 
    it 'can translate a braille char argument to an alpha char' do
      expect(@translator.braille_to_alpha("000...")).to eq('f')
      expect(@translator.braille_to_alpha("0..00.")).to eq('o')
      expect(@translator.braille_to_alpha("00..00")).to eq('x')
    end
  end

  describe '#untranslated' do
    it 'converts multiple braille chars into multiple alpha chars' do
      expect(@translator.untranslated("0.\n..\n..")).to eq('a')
      # expect(@translator.untranslated("0...0...0...0.\n0....0..0....0\n0...0...00....")).to eq('l o v e')
      # expect(@translator.untranslated("00.00.0.\n000.0..0\n....00..")).to eq('give')  
      # expect(@translator.untranslated("00.00.0...000...0...0.0.0.0.0.\n000.0..0.....0......0.00.0....\n....00....0...........0.....0.")).to eq('give me a break')  
    end
  end
end