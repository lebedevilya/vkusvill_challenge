ActiveAdmin.register_page 'Generate order' do

  page_action :foo, method: :post do
    order = Order.create
    params['items_count'].to_i.times do
      if params['weightable'] == 'on'
        product = Product.find(Product.pluck(:id).sample)
      else
        product = Product.find(Product.where(type: :countable).pluck(:id).sample)
      end
      if product.type == "countable"
        Item.create(order: order, product: product, count: rand(1..5))
      else
        Item.create(order: order, product: product, count: 1, weight: rand(1..10)*100, picker_weight: 0)
      end
    end
    redirect_to admin_orders_path
  end


  content do
    form action: "generate_order/foo", method: :post do |f|
      para {f.label 'Количество позиций'
      f.input :items_count, type: :number, name: 'items_count'}

      para {f.input :weightable, type: :checkbox, name: 'weightable'
      f.label 'Добавить весовой товар'}
      f.input :submit, type: :submit
    end
  end
end