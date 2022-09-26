# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  siren      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_name   (name)
#  index_companies_on_siren  (siren)
#
FactoryBot.define do
  factory :company do
    name { 'Company' }
    siren { '123456789' }
  end
end
