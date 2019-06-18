require 'rails_helper'

describe 'Updating books' do
  describe 'PATCH /books/:id' do
    it 'updates books' do
      book = create(:book, id: 1, name: "Foo", authors: ["John Doe"])

      patch api_v1_book_path(book.id), params: {
        name: 'Bar'
      }

      expect(response).to have_http_status(:success)
      expect(response_body).to eq load_json_from("spec/fixtures/updating/success.json")
    end
  end
end
