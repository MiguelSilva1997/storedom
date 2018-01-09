class Api::V1::ItemsController < ActionController::API

  def index
    render status: 200, json: Item.all, each_serializer: ItemSerializer
  end


end
