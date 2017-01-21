require 'rails_helper'

RSpec.describe Good, type: :model do
  subject { build :good }

  describe 'validations' do
    it { should validate_presence_of(:supplier_code) }
    it { should validate_presence_of(:sku) }
    it { should validate_uniqueness_of(:sku).scoped_to(:supplier_code) }
  end

  describe 'associations' do
    it { should belong_to(:supplier).with_primary_key(:code).with_foreign_key(:supplier_code) }
  end
end
