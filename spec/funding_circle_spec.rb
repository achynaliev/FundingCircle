require 'rspec'
require 'funding_circle'

describe PrimeMultiplicationTable do
  let(:pmt) {PrimeMultiplicationTable.new(4)}
  let(:pmt1) {PrimeMultiplicationTable.new(0)}
  let(:pmt2) {PrimeMultiplicationTable.new(-3)}

  describe '#initialize' do
    it 'creates list of n prime numbers' do
      expect(pmt.n_primes).to eq([2,3,5,7])
    end

    it 'creates 2d array of products' do
      expect(pmt.multipliation_table).to eq([[4, 6, 10, 14], [6, 9, 15, 21], [10, 15, 25, 35], [14, 21, 35, 49]])
    end

    it 'handles cases with 0 n primes' do
      expect(pmt1.n_primes).to eq([])
    end

    it 'handles cases with 0. Does not create 2d array' do
      expect(pmt1.multipliation_table).to eq([])
    end

    it 'handles cases with negative number. n primes' do
      expect(pmt1.n_primes).to eq([])
    end

    it 'handles cases with negative numbers. Does not create 2d array' do
      expect(pmt1.multipliation_table).to eq([])
    end
  end

  describe '#prime?' do
    it 'returns true if number is prime' do
      expect(pmt.prime?(19)).to be true
    end

    it 'return false if number is not prime' do
      expect(pmt.prime?(20)).to be false
    end
  end

  describe '#find_n_primes' do
    it 'finds # primes numbers' do
      expect(pmt.find_n_primes(15)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47])
    end

    it 'handles negative numbers' do
      expect(pmt.find_n_primes(-42)).to eq([])
    end
  end

end
