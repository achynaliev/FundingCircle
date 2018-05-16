require 'rspec'
require 'funding_circle'

describe PrimeMultiplicationTable do
  let(:pmt) {PrimeMultiplicationTable.new(4)}

  describe '#initialize' do
    it 'creates list of n prime numbers' do
      expect(pmt.n_primes).to eq([2,3,5,7])
    end
  end
end
