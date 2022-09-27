require_relative './spec_helper'

RSpec.describe Dictionary do 
  before(:each) do 
    @dictionary = Dictionary.new
  end

    it 'exists' do 
      expect(@dictionary).to be_a(Dictionary)
    end

    it 'has attributes' do
      expect(@dictionary.alpha).to be_a(Hash)
      expect(@dictionary.braille).to be_a(Hash)
    end

  describe '#alpha' do
    it 'can look up an English letter and find its Braille equivalent' do
      expect(@dictionary.alpha['a']).to eq('0.....')
      expect(@dictionary.alpha['b']).to eq('0.0...')
      expect(@dictionary.alpha[' ']).to eq('......')
    end
  end

  describe '#braille' do 
    it 'can invert the alpha dictionary to make the braille letters the keys and the alpha chars the values' do
      expect(@dictionary.braille['0.....']).to eq('a')
    end
  end
end