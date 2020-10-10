# frozen_string_literal: true

ActiveAdmin.register Item do
  permit_params :order_id, :product_id, :count, :weight, :picker_weight, :status
end
