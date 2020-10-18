# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  order_id      :integer          not null
#  product_id    :integer          not null
#  count         :integer
#  weight        :integer
#  picker_count  :integer
#  picker_weight :integer
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :order
  belongs_to :product
  enum status: [:created, :in_progress, :finished]

  def to_s
    "#{product.name} x#{count}"
  end

  def add_weight(weight)
    transaction do
      update(status: :in_progress)
      update(picker_weight: picker_weight+weight)
      update(status: :finished) if picker_weight >= weight
    end
  end

  def add_count(amount)
    transaction do
      update(status: :in_progress)
      update(picker_count: picker_count+amount)
      update(status: :finished) if picker_count >= count
    end
  end
end
