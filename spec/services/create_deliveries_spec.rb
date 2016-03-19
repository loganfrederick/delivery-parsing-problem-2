require 'rails_helper'

describe CreateDeliveries do
  describe '.call' do
    context 'when successful' do
      it 'imports the CSV' do
        described_class.new.call
        expect(Delivery.all.size).to be > 0
      end
    end
  end
end
