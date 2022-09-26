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
class Company < ApplicationRecord
  has_many :installations, dependent: :destroy

  validates :name, presence: true
  validates :siren, presence: true, format: { with: /\A([0-9]{9})\Z/ }
end
