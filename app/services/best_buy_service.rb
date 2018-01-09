class BestBuyService
  def get_stores(zip)
    response = @conn.get("stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,phone,city,distance&pageSize=10&apiKey=#{ENV['best_buy_key']}")
    JSON.parse(response.body)
  end

  private
    attr_reader :conn

    def initialize
      @conn ||= Faraday.new(url: "https://api.bestbuy.com/v1/")
    end

end
