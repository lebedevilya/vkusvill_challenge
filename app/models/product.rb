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
# frozen_string_literal: true

class Product < ApplicationRecord
  validates :price, :barcode, :name, presence: true

  enum type: [:countable, :weightable]
  self.inheritance_column = false
end
