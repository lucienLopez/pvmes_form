require 'rails_helper'

RSpec.describe 'Installation creation', type: :request do
  context 'when passing a valid form' do
    let(:company_attributes) { { name: 'company_name', siren: '123456789' } }
    let(:customer_attributes) { { name: 'Custo Mer', email: 'customer@mail.com', phone: '0123456789' } }
    let(:params) do
      {
        company: company_attributes,
        customer: customer_attributes,
        installation: {
          address: '23 installation road', date: '2020/01/15', type: 'hybrid',
          panel_ids: %w[123456 654321]
        }
      }
    end

    it 'creates installation correctly' do
      post installations_path, params: params, as: :json
      expect(response).to have_http_status :ok

      installation = Installation.last
      expect(installation).to be_present
      expect(installation).to(
        have_attributes(address: '23 installation road', date: '2020/01/15'.to_date, panel_type: 'hybrid')
      )

      expect(installation.company).to have_attributes(company_attributes)
      expect(installation.customer).to have_attributes(customer_attributes)

      expect(installation.panels.where(panel_type: :hybrid, code: '123456')).to be_present
      expect(installation.panels.where(panel_type: :hybrid, code: '654321')).to be_present
    end
  end

  context 'when passing an invalid form' do
    it "returns unprocessable_entity and doesn't create anything"
  end
end
