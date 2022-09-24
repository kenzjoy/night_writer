require_relative './spec_helper'

RSpec.describe NightWriter do
  before(:each) do
    @writer = NightWriter.new('message.txt', 'braille.txt')
  end

    it 'exists' do  
      expect(@writer).to be_a(NightWriter)
    end

    it 'has attributes' do
      expect(@writer.input).to eq('message.txt')
      expect(@writer.output).to eq('braille.txt')
    end

  describe '#message' do
    it 'can return a dynamic message' do
      expect(@writer.message).to eq("Created #{ARGV[1]} containing #{capitalize_text.length} characters")
    end
  end
end