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
end