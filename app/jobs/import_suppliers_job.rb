require 'csv'

class ImportSuppliersJob < ApplicationJob
  queue_as :default

  def perform(path)
    values = CSV.read path, col_sep: '¦'
    columns = [:code, :name]
    options = {
      validate: false,
      on_duplicate_key_update: {
        conflict_target: :code,
        columns: [:name],
        batch_size: 100
      }
    }

    Supplier.import columns, values, options
  end
end
