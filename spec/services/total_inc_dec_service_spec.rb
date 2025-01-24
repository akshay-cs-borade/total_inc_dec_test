require 'rails_helper'

RSpec.describe TotalIncDecService do
  describe '#call' do
    it 'returns 1 when x = 0' do
      result = TotalIncDecService.new(0).call
      expect(result).to eq(1)
    end

    it 'returns 10 when x = 1' do
      result = TotalIncDecService.new(1).call
      expect(result).to eq(10)
    end

    it 'returns 100 when x = 2' do
      result = TotalIncDecService.new(2).call
      expect(result).to eq(100)
    end

    it 'returns 475 when x = 3' do
      result = TotalIncDecService.new(3).call
      expect(result).to eq(475)
    end

    it 'returns 1675 when x = 4' do
      result = TotalIncDecService.new(4).call
      expect(result).to eq(1675)
    end

    it 'returns 4954 when x = 5' do
      result = TotalIncDecService.new(5).call
      expect(result).to eq(4954)
    end

    it 'returns 12952 when x = 6' do
      result = TotalIncDecService.new(6).call
      expect(result).to eq(12952)
    end
  end
end
