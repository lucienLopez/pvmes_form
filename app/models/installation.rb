# == Schema Information
#
# Table name: installations
#
#  id           :bigint           not null, primary key
#  address      :string
#  date         :date
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
class Installation < ApplicationRecord
  enum type: {
    photovoltaic: 0,
    hybrid: 1
  }

  belongs_to :company
  belongs_to :customer

  has_many :panels, dependent: :destroy

  validates :address, presence: true
end
