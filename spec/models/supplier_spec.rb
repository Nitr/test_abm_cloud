require 'rails_helper'

RSpec.describe Supplier, type: :model do
  subject { build :supplier }

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:goods).with_primary_key(:code).with_foreign_key(:supplier_code) }
  end
end
