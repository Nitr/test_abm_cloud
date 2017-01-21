require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  describe "GET index" do
    it "returns a 200 status code when no records" do
      get :index
      expect(response.status).to eq(200)
    end

    it "returns a 200 status code with records" do
      create_list :good, 26
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST import" do
    subject do
      post :import, params: { file: fixture_file_upload('sku.csv') }
    end

    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it "enqueue ImportGoodsJob" do
      expect{subject}.to enqueue_job(ImportGoodsJob)
    end

    it 'redirect to goods_url' do
      expect(subject).to redirect_to(goods_url)
    end
  end
end
