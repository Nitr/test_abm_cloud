require 'csv'

class ImportGoodsJob < ApplicationJob
  queue_as :default

  def perform(path)
    values = CSV.read path, col_sep: '¦'
    columns = [:sku, :supplier_code, *(1..6).map { |n| "field#{n}".to_sym }, :price]
    options = {
      validate: false,
      on_duplicate_key_update: {
        conflict_target: [:sku, :supplier_code],
        columns: [*(1..6).map { |n| "field#{n}".to_sym }, :price],
        batch_size: 100
      }
    }

    Good.import columns, values, options
  end
end
