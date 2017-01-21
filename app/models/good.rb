class Good < ApplicationRecord
  belongs_to :supplier, primary_key: 'code', foreign_key: 'supplier_code'

  validates :supplier_code, presence: true
  validates :sku, presence: true, uniqueness: { scope: :supplier_code }
end
