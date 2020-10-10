# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  barcode      :string
#  type         :integer
#  weight       :integer
#  manufacturer :text
#  price        :integer
#  composition  :text
#  photo        :text
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Product < ApplicationRecord
  enum type: [:countable, :weightable]
end
