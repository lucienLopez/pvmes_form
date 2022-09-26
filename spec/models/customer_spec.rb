require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    context 'with valid fields' do
      let!(:customer) { build(:customer, email: 'aaa@mail.com', phone: '0123456789') }

      it 'is valid' do
        expect(customer).to be_valid
      end
    end

    context 'with invalid email' do
      let!(:customer) { build(:customer, email: 'aaa') }

      it 'is not valid' do
        expect(customer).not_to be_valid
      end
    end

    context 'with short phone' do
      let!(:customer) { build(:customer, phone: '012345') }

      it 'is not valid' do
        expect(customer).not_to be_valid
      end
    end

    context 'with letters in phone' do
      let!(:customer) { build(:customer, phone: '012345AA89') }

      it 'is not valid' do
        expect(customer).not_to be_valid
      end
    end
  end
end
