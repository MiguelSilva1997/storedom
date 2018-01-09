class BestBuyStore
  attr_reader :name,
              :type,
              :phone,
              :city,
              :distance

  def initialize(data)
    @name = data['longName']
    @type = data['storeType']
    @phone = data['phone']
    @city = data['city']
    @distance = data['distance']
  end
end
