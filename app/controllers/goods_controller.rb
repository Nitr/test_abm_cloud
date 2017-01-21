class GoodsController < ApplicationController
  def index
    @goods = Good.joins(:supplier).page(params[:page])
  end

  def import
    ImportGoodsJob.perform_later params[:file].path

    redirect_to goods_url
  end
end
