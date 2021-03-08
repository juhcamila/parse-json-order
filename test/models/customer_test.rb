require "test_helper"

describe Customer do
  let(:customer) {customers(:one)}

  it 'must be valid' do
    expect(customer).must_be :valid?
  end

  context 'externalCode' do
    it 'cant be nil' do
      customer.externalCode = nil
      expect(customer).wont_be :valid?
    end
  end

  context 'name' do
    it 'cant be nil' do
      customer.name = nil
      expect(customer).wont_be :valid?
    end
  end

  context 'email' do
    it 'cant be nil' do
      customer.email = nil
      expect(customer).wont_be :valid?
    end
  end

  context 'contact' do
    it 'cant be nil' do
      customer.contact = nil
      expect(customer).wont_be :valid?
    end
  end
end
