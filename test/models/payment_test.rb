require "test_helper"

describe Payment do
  let(:payment) { payments(:one) }

  it 'must be valid' do
    expect(payment).must_be :valid?
  end

  context 'payment type' do
    it 'cant be nil' do
      payment.payment_type = nil
      expect(payment).wont_be :valid?
    end
  end

  context 'value' do
    it 'cant be nil' do
      payment.value = nil
      expect(payment).wont_be :valid?
    end
  end

  context 'order id' do
    it 'cant be nil' do
      payment.order_id = nil
      expect(payment).wont_be :valid?
    end
  end
end
