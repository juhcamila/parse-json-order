require "test_helper"

describe Order do
  let(:order) { orders(:one) }

  it 'must be valid' do
    expect(order).must_be :valid?
  end

  context 'externalCode' do
    it 'cant be nil' do
      order.externalCode = nil
      expect(order).wont_be :valid?
    end
  end

  context 'store id' do
    it 'cant be nil' do
      order.storeId = nil
      expect(order).wont_be :valid?
    end
  end

  context 'deliveryFee' do
    it 'cant be nil' do
      order.deliveryFee = nil
      expect(order).wont_be :valid?
    end
  end

  context 'total shipping' do
    it 'cant be nil' do
      order.total_shipping = nil
      expect(order).wont_be :valid?
    end
  end

  context 'total' do
    it 'cant be nil' do
      order.total = nil
      expect(order).wont_be :valid?
    end
  end

  context 'country' do
    it 'cant be nil' do
      order.country = nil
      expect(order).wont_be :valid?
    end
  end

  context 'state' do
    it 'cant be nil' do
      order.state = nil
      expect(order).wont_be :valid?
    end
  end

  context 'city' do
    it 'cant be nil' do
      order.city = nil
      expect(order).wont_be :valid?
    end
  end

  context 'district' do
    it 'cant be nil' do
      order.district = nil
      expect(order).wont_be :valid?
    end
  end

  context 'street' do
    it 'cant be nil' do
      order.street = nil
      expect(order).wont_be :valid?
    end
  end

  context 'complement' do
    it 'cant be nil' do
      order.complement = nil
      expect(order).wont_be :valid?
    end
  end

  context 'latitude' do
    it 'cant be nil' do
      order.latitude = nil
      expect(order).wont_be :valid?
    end
  end

  context 'longitude' do
    it 'cant be nil' do
      order.longitude = nil
      expect(order).wont_be :valid?
    end
  end

  context 'dt Order Create' do
    it 'cant be nil' do
      order.dtOrderCreate = nil
      expect(order).wont_be :valid?
    end
  end

  context 'postalCode' do
    it 'cant be nil' do
      order.postalCode = nil
      expect(order).wont_be :valid?
    end
  end

  context 'number' do
    it 'cant be nil' do
      order.number = nil
      expect(order).wont_be :valid?
    end
  end
end
