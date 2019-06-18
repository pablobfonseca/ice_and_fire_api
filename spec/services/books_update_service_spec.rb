require 'rails_helper'

describe BooksUpdateService do
  describe '#perform' do
    it 'updates a book' do
      book = create(:book, name: "Foo")
      params = { name: "Bar" }

      expect {
        described_class.new(book.id, params).perform
      }.to change { book.reload.name }.to eq "Bar"
    end
  end
end
