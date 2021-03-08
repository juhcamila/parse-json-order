require "test_helper"

describe Item do
  let(:item) { items(:one) }

  it 'must be valid' do
    expect(item).must_be :valid?
  end

  context 'externalCode' do
    it 'cant be nil' do
      item.externalCode = nil
      expect(item).wont_be :valid?
    end
  end

  context 'name' do
    it 'cant be nil' do
      item.name = nil
      expect(item).wont_be :valid?
    end
  end

  context 'price' do
    it 'cant be nil' do
      item.price = nil
      expect(item).wont_be :valid?
    end
  end

  context 'total' do
    it 'cant be nil' do
      item.total = nil
      expect(item).wont_be :valid?
    end
  end

  context 'order id' do
    it 'cant be nil' do
      item.order_id = nil
      expect(item).wont_be :valid?
    end
  end
end
