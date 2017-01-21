require 'rails_helper'

RSpec.describe ImportSuppliersJob, type: :job do
  it "create new supplier" do
    expect{
      ImportSuppliersJob.perform_now(file_fixture('supplier1.csv'))
    }.to change { Supplier.count }.from(0).to(1)
  end

  it "update name of exisisted supplier" do
    supplier = create :supplier, code: 's0001', name: 'Supplier'

    expect{
      ImportSuppliersJob.perform_now(file_fixture('supplier1.csv'))
    }.to change { supplier.reload.name }.from(supplier.name).to('Supplier 1')
  end
end
