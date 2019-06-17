require 'rails_helper'

describe 'Creating new books' do
  describe 'POST /books' do
    it 'creates a new book in the database' do
      post api_v1_books_path, params: {
        name: "The Rogue Prince",
        isbn: "978-0345537263",
        authors: ["George R. R. Martin"],
        country: "United States",
        number_of_pages: "832",
        publisher: "Bantam Books",
        release_date: "1996-08-01"
      }

      expect(response).to have_http_status(:created)
      expect(response_body[:status_code]).to eq 201
      expect(response_body).to eq load_json_from("spec/fixtures/creating/success.json")
    end
  end
end
