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
class Item < ApplicationRecord
  belongs_to :order
  belongs_to :product
  enum status: [:new, :in_progress, :finished]

end
