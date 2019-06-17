require 'rails_helper'

describe Book, type: :model do
  describe '#as_json' do
    it 'returns the formatted json representation' do
      book = FactoryBot.create(:book)
      json = book.to_json(status_code: 201, status: "success")

      expect(JSON.parse(json, symbolize_names: true))
        .to eq load_json_from("spec/fixtures/creating/success.json")
    end
  end
end
