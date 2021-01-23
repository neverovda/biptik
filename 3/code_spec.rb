require 'rspec'
require_relative 'code.rb'

describe Code do
  it 'correct code' do
    expect(Code.new('4561261212345467').correct?).to be_truthy
  end

  it 'incorrect code' do
    expect(Code.new('4561261212345464').correct?).to be_falsey
  end

  it 'correct code' do
    expect(Code.new('4561 2612 1234 5467').correct?).to be_truthy
  end

  it 'number of wagon' do
    expect(Code.new('512 25 407').correct?).to be_truthy
  end

  it 'Inappropriate characters' do
    expect { Code.new('45612aaa5464') }
      .to raise_error(Code::InappropriateCharactersError, 'Inappropriate characters')
  end

  it 'Inappropriate characters' do
    expect { Code.new('     1    ').correct? }
      .to raise_error(Code::ShortCodeError, 'Short code')
  end
end
