class SearchController < ApplicationController
  def index
    @stores = BestBuy.new(params['search']).stores
    @total = BestBuy.new(params['search']).total
  end
end
