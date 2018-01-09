class Api::V1::ItemsController < Api::V1::ApplicationController

  def index
    render status: 200, json: Item.all, each_serializer: ItemSerializer
  end


end
