require 'rails_helper'

describe 'Listing books' do
  describe 'GET /books' do
    it 'lists books as json with books data' do
      game_of_thrones = build_stubbed(:game_of_thrones_book, id: 1)
      clash_of_kings  = build_stubbed(:clash_of_kings_book, id: 2)

      allow(Book).to receive(:all) { [game_of_thrones, clash_of_kings] }

      get api_v1_books_path

      expect(response).to have_http_status(:success)
      expect(response_body).to eq load_json_from("spec/fixtures/listing/success.json")
    end

    it 'returns json with no data' do
      get api_v1_books_path

      expect(response).to have_http_status(:success)
      expect(response_body).to eq load_json_from("spec/fixtures/listing/no_results.json")
    end
  end
end
