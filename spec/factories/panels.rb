# == Schema Information
#
# Table name: panels
#
#  id              :bigint           not null, primary key
#  code            :string
#  panel_type      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  installation_id :bigint
#
# Indexes
#
#  index_panels_on_code             (code)
#  index_panels_on_installation_id  (installation_id)
#
# Foreign Keys
#
#  fk_rails_...  (installation_id => installations.id)
#
FactoryBot.define do
  factory :panel do
    association :installation

    code { '123456' }
    panel_type { :photovoltaic }
  end
end
