class VendorsController < ApplicationController
  def show
    @vendor_facade = VendorFacade.new(id: params[:id])

    if market_search_params.present?
      @market_facade = MarketFacade.new(search_params: market_search_params)
    else
      @market_facade = MarketFacade.new
    end
  end

  private

  def market_search_params
    params.permit(:name, :city, :state)
  end
end
