class Supplier < ApplicationRecord
  has_many :goods, primary_key: 'code', foreign_key: 'supplier_code'

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
