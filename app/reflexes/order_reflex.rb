# frozen_string_literal: true

class OrderReflex < StimulusReflex::Reflex
  def scan
    order = Order.find(params[:id])
    barcode = params[:order][:barcode]
    product = BarcodeParser.call(barcode)
    if product.nil?
      @error = "Штрих-код #{barcode} не найден в базе"
      return
    end

    item = order.items.find_by(product_id: product.id)
    if product.nil?
      @error = "Штрих-код #{barcode} не найден в заказе"
      return
    end

    barcode_weight = barcode[7..12].to_i if product.weightable?
    barcode_weight ? item.add_weight(barcode_weight) : item.add_count(1)
    order.update(status: 'finished') if order.items.pluck(:status).all? 'finished'
  rescue StandardError => e
    @error = e
  end
end
