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
class Panel < ApplicationRecord
  enum panel_type: {
    photovoltaic: 0,
    hybrid: 1
  }

  belongs_to :installation, counter_cache: true

  validates :code, presence: true, format: { with: /\A([0-9]{6})\Z/ }
  validates :panel_type, presence: true
end
