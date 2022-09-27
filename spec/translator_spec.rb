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
      expect(@translator.alpha_to_braille('a')).to eq('0.....')
      expect(@translator.alpha_to_braille('b')).to eq('0.0...')
    end
  end

  describe '#stacked_braille' do
    it 'properly stacks braille letters from 1x6 to 3x2' do
      expect(@translator.stacked_braille('a')).to eq("0.\n..\n..")
    end
  end

  describe '#translated' do
    it 'translates multiple characters/words from english to braille' do
      expect(@translator.translated('give')).to eq("00.00.0.\n000.0..0\n....00..\n")  
    end
  end
end