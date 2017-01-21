require 'rails_helper'

RSpec.describe ImportGoodsJob, type: :job do
  let(:supplier){ create :supplier, code: 's0001'}

  it "create new good" do
    expect{
      ImportGoodsJob.perform_now(file_fixture('sku1.csv'))
    }.to change { Good.count }.from(0).to(1)
  end

  it "create new if sku and supplier are not existed" do
    good = create :good, sku: '00000001', supplier: create(:supplier, code: 's0002')

    expect{
      ImportGoodsJob.perform_now(file_fixture('sku1.csv'))
    }.to change { Good.count }
  end

  it "update good if sku and supplier are existed" do
    good = create :good, sku: '00000001', supplier: supplier

    expect{
      ImportGoodsJob.perform_now(file_fixture('sku1.csv'))
    }.to change { good.reload.price}.from(good.price).to(10.25)
  end
end
