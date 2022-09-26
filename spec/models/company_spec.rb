require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    context 'with valid fields' do
      let!(:company) { build(:company, name: 'company', siren: '123456789') }

      it 'is valid' do
        expect(company).to be_valid
      end
    end

    context 'with short siren' do
      let!(:company) { build(:company, name: 'company', siren: '12345678') }

      it 'is not valid' do
        expect(company).not_to be_valid
      end
    end

    context 'with letters in siren' do
      let!(:company) { build(:company, name: 'company', siren: '1234AA789') }

      it 'is not valid' do
        expect(company).not_to be_valid
      end
    end
  end
end
