# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :customer do
    name { 'Bob Bob' }
    email { 'bob@email.com' }
    phone { '0123456789' }
  end
end
