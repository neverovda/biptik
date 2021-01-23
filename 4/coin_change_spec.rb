require 'rspec'
require_relative 'coin_change.rb'

describe Cashier do
  it 'change 15' do
    expect(Cashier.change(15)).to eq [10, 5]
  end

  it 'change 40' do
    expect(Cashier.change(40)).to eq [25, 10, 5]
  end

  it 'change 63' do
    expect(Cashier.change(63)).to eq [25, 25, 10, 1, 1, 1]
  end

  it 'change 99' do
    expect(Cashier.change(199)).to eq [100, 25, 25, 25, 10, 10, 1, 1, 1, 1]
  end
end
