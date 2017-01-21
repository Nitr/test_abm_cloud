class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.page params[:page]
  end

  def import
    ImportSuppliersJob.perform_later params[:file].path

    redirect_to suppliers_url
  end
end
