class Api::V1::ItemsController < Api::V1::BaseController
  before_action :item, only: [:show]

  def index
    render status: 200, json: Item.all, each_serializer: ItemSerializer
  end

  def show
    render status: 200, json: item, serializer: ItemSerializer
  end

  def create
    item = Item.create(item_params)
    render status: 201, json: item, serializer: ItemSerializer
  end


  def update
    item.update(item_params)
    render status: 202, json: item, serializer: ItemSerializer
  end

  def destroy
    item.destroy
    render json: {
      flash: "Item was deleted",
      status: 204
    }
  end


  private
    def item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
