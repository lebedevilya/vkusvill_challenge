# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.created.includes(:items)
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.fetch(:order, {})
  end
end
