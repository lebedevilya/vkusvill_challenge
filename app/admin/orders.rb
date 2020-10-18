# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :status, :started_at, :finished_at
  includes items: :product

  index do
    selectable_column
    id_column
    column :status
    column :started_at
    column :finished_at
    column :created_at
    column :items_count do |order|
      order.items.count
    end
    actions
  end

  show do
    attributes_table do
      row :status
      row :started_at
      row :finished_at
      row :created_at
      row :items
    end
  end

  form do |f|
    f.inputs 'Answer' do
      input :status
      input :started_at, as: :date_time_picker
      input :finished_at, as: :date_time_picker
      input :item_ids, as: :select, multiple: true, collection: Item.all, label: 'Item list'
    end
    f.actions
  end
end
