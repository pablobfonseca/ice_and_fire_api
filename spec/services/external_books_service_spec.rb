require 'rails_helper'

describe ExternalBooksService do
  subject { described_class }

  it 'returns a list of books given a name parameter' do
    VCR.use_cassette('external-books') do
      params = { name: "A Game of Thrones" }
      response = subject.call(params)

      expect(response).to eq load_json_from("spec/fixtures/external_books/success.json")
    end
  end

  it 'does not show any result on data node' do
    VCR.use_cassette('external_books-no-result') do
      params = { name: "Foo and Bar" }
      response = subject.call(params)

      expect(response).to eq load_json_from("spec/fixtures/external_books/no_results.json")
    end
  end
end
