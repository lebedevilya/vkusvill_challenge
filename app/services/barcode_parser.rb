# frozen_string_literal: true

class BarcodeParser
  def self.call(barcode)
    # find countable product
    product = Product.find_by(type: :countable, barcode: barcode)

    return product if product.present?

    # find weightable product
    barcode_id = barcode[0..6]
    Product.find_by(type: :weightable, barcode: barcode_id)
  end
end
