# frozen_string_literal: true

# active admin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# fill products
catalog = Creek::Book.new(Rails.root.join('tmp', 'catalog.xlsx')).sheets[0]
catalog.simple_rows.drop(1).each do |row|
  product_data = {
    name: row['D'],
    description: row['AB'],
    barcode: row['O'].to_i.to_s,
    type: row['J'] == 'шт' ? 0 : 1,
    weight: row['K'].to_f * 100,
    manufacturer: row['G'],
    price: row['AA'],
    composition: row['AC'],
    photo: row['W']
  }
  Product.create(product_data)
end
