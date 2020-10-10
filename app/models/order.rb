# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  status      :integer
#  started_at  :datetime
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Order < ApplicationRecord
  has_many :items
  enum status: [:new, :in_progress, :finished]
end
