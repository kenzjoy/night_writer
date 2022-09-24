require_relative './spec_helper'

RSpec.describe NightWriter do
  it 'exists' do
    writer = NightWriter.new('message.txt', 'braille.txt')
    
    expect(writer).to be_a(NightWriter)
  end
end