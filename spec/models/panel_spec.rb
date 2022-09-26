require 'rails_helper'

RSpec.describe Panel, type: :model do
  describe 'validations' do
    context 'with valid fields' do
      let!(:panel) { build(:panel, code: '123456', panel_type: :photovoltaic) }

      it 'is valid' do
        expect(panel).to be_valid
      end
    end

    context 'with short code' do
      let!(:panel) { build(:panel, code: '12345', panel_type: :photovoltaic) }

      it 'is not valid' do
        expect(panel).not_to be_valid
      end
    end

    context 'with letters in code' do
      let!(:panel) { build(:panel, code: '12AA56', panel_type: :photovoltaic) }

      it 'is not valid' do
        expect(panel).not_to be_valid
      end
    end
  end
end
