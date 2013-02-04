class RemainingStocksController < ApplicationController
  def show
    @stock_list_items = StockListItem.all
  end
end
