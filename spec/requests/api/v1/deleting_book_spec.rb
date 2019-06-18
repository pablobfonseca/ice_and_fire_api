require 'rails_helper'

describe 'Deleting book' do
  describe 'DELETE /books/:id' do
    it 'deletes a book' do
      book = create(:book, name: "Foo")

      expect {
        delete api_v1_book_path(book.id)
      }.to change(Book, :count).from(1).to(0)

      expect(response).to have_http_status(:success)
      expect(response_body).to eq load_json_from("spec/fixtures/deleting/success.json")
    end
  end
end
