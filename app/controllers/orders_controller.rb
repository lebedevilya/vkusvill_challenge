# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def show
  end

  def scan
    @order = Order.find(params[:order_id])
    parse_barcode(params[:barcode])
    return redirect_to @order, notice: 'not_found' unless @product_id

    item = @order.items.find_by(product_id: @product_id)

    return redirect_to @order, notice: 'not_in_order' unless item

    @barcode_weight ?
      item.add_weight( @barcode_weight ) :
      item.add_count( 1 )

    redirect_to @order, notice: 'success'
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

  def parse_barcode(barcode)
    @product_id = Product.where(type: :countable, barcode: barcode)&.take&.id
    unless @product_id
      barcode_id = barcode[0..6]
      @barcode_weight = barcode[7..12].to_i
      @product_id = Product.where(type: :weightable, barcode: barcode_id)&.take&.id
    end
  end
end
