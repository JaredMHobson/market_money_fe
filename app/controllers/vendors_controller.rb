class VendorsController < ApplicationController
  def show
    @facade = VendorFacade.new(id: params[:id])
  end
end
