require 'rails_helper'

RSpec.describe 'Items API' do
  let(:item) { Item.create(name: "Soccer Ball",
               description: "the best gift ever",
               image_url: "https://m.media-amazon.com/images/S/aplus-media/vc/7895a621-9359-412d-92d2-94c15adc4c70.jpg")}

  let(:item_1) { Item.create(name: "Goal",
                description: "you have to have it",
                image_url: "https://m.media-amazon.com/images/S/aplus-media/vc/7895a621-9359-412d-92d2-94c15adc4c70.jpg")}

  describe "when the user visits /items" do
    it "returns all the items and a 200 response" do
      item
      item_1
      get "/api/v1/items"

      data = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(data.count).to eq(2)
      expect(data.first['id']).to eq(item.id)
      expect(data.first['description']).to eq(item.description)
      expect(data.first['image_url']).to eq(item.image_url)
      expect(data.first['created_at']).to be_nil
      expect(data.first['updated_at']).to be_nil
    end

    it "returns the item and a 200 response" do
      item

      get "/api/v1/items/#{item.id}"

      data = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(data['id']).to eq(item.id)
      expect(data['description']).to eq(item.description)
      expect(data['image_url']).to eq(item.image_url)
      expect(data['created_at']).to be_nil
      expect(data['updated_at']).to be_nil
    end

    it "deletes the items and a 204 response" do
      item_1
      item
      delete "/api/v1/items/#{item_1.id}"

      data = JSON.parse(response.body)

      expect(data['status']).to eq(204)
      expect(data['message']).to eq("Successfully deleted #{item_1.name}.")
    end

    it 'can create an item' do
      post '/api/v1/items', params: { item: { name: "Player",
                                              description: "best ever",
                                              image_url: "https://cdn.gobankingrates.com/wp-content/uploads/2017/05/Neymar-848x477.jpg"} }

      data = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(data['name']).to eq("Player")
      expect(data['created_at']).to be_nil
      expect(data['updated_at']).to be_nil
    end

    it 'can update an item' do
      item_1

      patch "/api/v1/items/#{item_1.id}",  params: { item: { name: "Stadium"} }

      data = JSON.parse(response.body)
      expect(response.status).to eq(202)
      expect(data['id']).to eq(item_1.id)
    end
  end
end
