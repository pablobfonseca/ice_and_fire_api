require 'rails_helper'

describe JSONBuilder do
  describe "#build_list" do
    it 'returns the json structure for listing' do
      game_of_thrones = build_stubbed(:game_of_thrones_book, id: 1)
      clash_of_kings  = build_stubbed(:clash_of_kings_book, id: 2)

      books = [game_of_thrones, clash_of_kings]

      expect(described_class.new(books).build_list)
        .to eq load_json_from("spec/fixtures/listing/success.json")
    end
  end
end
