# == Schema Information
#
# Table name: installations
#
#  id           :bigint           not null, primary key
#  address      :string
#  date         :date
#  panel_type   :integer
#  panels_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint
#  customer_id  :bigint
#
# Indexes
#
#  index_installations_on_company_id   (company_id)
#  index_installations_on_customer_id  (customer_id)
#  index_installations_on_date         (date)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (customer_id => customers.id)
#
FactoryBot.define do
  factory :installation do
    association :company
    association :customer

    address { '2 imaginary road' }
    date { '2010/01/01'.to_date }
    panel_type { :photovoltaic }
  end
end
