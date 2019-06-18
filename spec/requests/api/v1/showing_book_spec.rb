require 'rails_helper'

describe 'Showing a book' do
  describe 'GET /books/:id' do
    it 'shows a book' do
      book = create(:game_of_thrones_book, id: 1)

      get api_v1_book_path(book.id)

      expect(response).to have_http_status(:success)
      expect(response_body).to eq load_json_from("spec/fixtures/showing/success.json")
    end
  end
end
