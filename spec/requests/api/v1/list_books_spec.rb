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

    context 'searching' do
      it 'searches by name' do
        book = create(:game_of_thrones_book)
        get api_v1_books_path, params: { name: "A Game of Thrones" }

        expect(response).to have_http_status(:success)
        expect(response_body.dig(:data, 0, :name)).to eq("A Game of Thrones")
      end

      it 'searches by country' do
        book = create(:book, country: "Norway")
        get api_v1_books_path, params: { country: "Norway" }

        expect(response).to have_http_status(:success)
        expect(response_body.dig(:data, 0, :country)).to eq("Norway")
      end

      it 'searches by publisher' do
        book = create(:book, publisher: "Acme")
        get api_v1_books_path, params: { publisher: "Acme" }

        expect(response).to have_http_status(:success)
        expect(response_body.dig(:data, 0, :publisher)).to eq("Acme")
      end

      it 'searches by release_date (year)' do
        book = create(:book, release_date: "2019-01-01")
        get api_v1_books_path, params: { release_date: 2019 }

        expect(response).to have_http_status(:success)
        expect(response_body.dig(:data, 0, :release_date)).to eq("2019-01-01")
      end
    end
  end
end
