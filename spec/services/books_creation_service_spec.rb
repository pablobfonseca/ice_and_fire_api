require 'rails_helper'

describe BooksCreationService do
  describe '#perform' do
    it 'creates a new book' do
      params = {
        name: "The Rogue Prince",
        isbn: "978-0345537263",
        authors: ["George R. R. Martin"],
        country: "United States",
        number_of_pages: "832",
        publisher: "Bantam Books",
        release_date: "2014-06-17"
      }

      expect {
        described_class.new(params).perform
      }.to change(Book, :count).by(1)

      book = Book.last

      expect(book.name).to eq "The Rogue Prince"
      expect(book.authors).to eq ["George R. R. Martin"]
    end
  end
end
