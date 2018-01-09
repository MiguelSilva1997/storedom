class Api::V1::ItemsController < Api::V1::ApplicationController
  before_action :item, only: [:show]

  def index
    render status: 200, json: Item.all, each_serializer: ItemSerializer
  end

  def show
    render status: 200, json: item, serializer: ItemSerializer
  end

  private
    def item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
