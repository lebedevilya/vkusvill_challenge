# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params Product.attribute_names.map(&:to_sym)

  index do
    (Product.column_names - ['description']).each do |c|
      column c.to_sym
    end
    column :description do |product|
      truncate(product.description, omision: '...', length: 100)
    end
  end
end
