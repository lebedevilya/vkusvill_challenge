module OrdersHelper
  def price_desc(product)
    product.type == 'countable' ? "р/шт" : "р/кг"
  end
end
