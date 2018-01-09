class BestBuy
  def initialize(filter = {})
    @filter = filter
  end

  def stores
    raw_data = best_buy_service.get_stores(filter)['stores']
    generate_stores(raw_data)
  end

  def total
    best_buy_service.get_stores(filter)['total']
  end

  def generate_stores(raw_data)
    raw_data.map { |data| BestBuyStore.new(data) }
  end

  private
    attr_reader :filter

    def best_buy_service
      @best_buy_service ||= BestBuyService.new
    end
end
