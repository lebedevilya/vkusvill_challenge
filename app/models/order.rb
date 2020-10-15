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
# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  enum status: [:created, :in_progress, :finished]

  def to_s
    "Order №#{id}"
  end
end
