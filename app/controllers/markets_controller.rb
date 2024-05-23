class MarketsController < ApplicationController
  def index
    @facade = MarketFacade.new
  end

  def show
    @facade = MarketFacade.new(id: params[:id])
  end
end
