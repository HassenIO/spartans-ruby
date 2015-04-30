require 'spec_helper'

describe Spartans do
  let(:item_id) { 42 }
  let(:item_name) { 'Nice House' }
  let(:item_properties) { {price: 200000, area: 100, city: 'Blida', avaliable: true} }

  before(:all) do
    Spartans.init app_id: '640b97', api_key: 'bacd9285a612fb6378c365e9fbb8a0f7'
  end

  describe '.get_items' do
    it 'gets a list of pushed items from Spartans API'  do
      api = Spartans.get_items

      expect(api['status']).to eq(200)
    end
  end

  describe '.push_item(item_data_hash)' do
    it 'pushes item data hash to Spartans API' do
      api = Spartans.push_item(id: item_id, name: item_name, properties: item_properties)

      expect(api['status']).to eq(201)
      expect(api['item']['id']).to eq(item_id.to_s)
      expect(api['item']['name']).to eq(item_name)
    end
  end

end
