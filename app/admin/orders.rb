# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :status, :started_at, :finished_at
end
