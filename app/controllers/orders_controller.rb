# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def index
    @orders = Order.created.includes(:items)
  end

  def show
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Success'
    else
      redirect_to @order, notice: 'Error'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.fetch(:order, {}).permit!
  end
end
